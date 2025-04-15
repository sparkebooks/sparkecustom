import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

double? getProgressBarValue(
  int? totalValue,
  int? progressValue,
) {
  // take the progressValue and divide by the totalValue and return as a double
  if (totalValue == null || progressValue == null || totalValue == 0) {
    return null;
  }
  return progressValue / totalValue;
}

DateTime? getLastMonth(DateTime? currentTime) {
  // take the currentTime and return the previous month
  if (currentTime == null) return null;
  return DateTime(currentTime.year, currentTime.month - 1, currentTime.day);
}

double? getProgressBarValueUpdate(
  int? totalValue,
  int? progressValue,
) {
  // take the progressValue and divide by the totalValue and return as a double
  if (totalValue == null || progressValue == null || totalValue == 0) {
    return null;
  }
  return (progressValue / totalValue) * 100;
}

int? returnCountdownTimer(
  DateTime? currentTime,
  DateTime? dailyPassExpiration,
) {
  // I would like to take the current time, and return an integer of 24 hours in milliseconds
  if (currentTime == null || dailyPassExpiration == null) {
    return null;
  }
  final difference = dailyPassExpiration.difference(currentTime);
  final milliseconds = difference.inMilliseconds;
  return math.max(milliseconds, 0);
}

DateTime? getTomorrowsDateTime(DateTime? currentTime) {
  // take the current time and calculate 24 hours in the future.
  if (currentTime != null) {
    return currentTime.add(Duration(hours: 24));
  } else {
    return null;
  }
}

List<dynamic> chunkText(
  String text,
  int wordsPerPage,
) {
  List<String> words = text
      .split(RegExp(r'\s+'))
      .where((word) => word.trim().isNotEmpty)
      .toList();

  print('Total words: ${words.length}'); // Debugging

  List<String> pages = [];
  List<String> currentPageWords = [];

  for (int i = 0; i < words.length; i++) {
    String word = words[i];
    currentPageWords.add(word);

    if (currentPageWords.length >= wordsPerPage || i == words.length - 1) {
      pages.add(currentPageWords.join(' '));
      print(
          'Added page ${pages.length} with ${currentPageWords.length} words'); // Debugging
      currentPageWords = [];
    }
  }

  print('Total pages: ${pages.length}'); // Debugging

  return pages;
}

List<dynamic> paginateText(
  String text,
  int wordsPerPage,
) {
  List<String> words = text.split(RegExp(r'\s+'));
  List<Map<String, dynamic>> pages = [];

  for (int i = 0; i < words.length; i += wordsPerPage) {
    int endIndex = i + wordsPerPage;
    if (endIndex > words.length) endIndex = words.length;

    String pageContent = words.sublist(i, endIndex).join(' ');
    pages.add({
      'pageNumber': (i ~/ wordsPerPage) + 1,
      'content': pageContent,
    });
  }

  return pages;
}

List<dynamic> paginateChapterContent(
  List<String> chapterContents,
  int wordsPerPage,
  List<String> chapterNames,
  List<int> ids,
  double screenHeight,
  double screenWidth,
  double fontSize,
  double paddingTop,
  double paddingBottom,
) {
  List<dynamic> pages = [];
  int pageNumber = 1;
  for (int i = 0; i < chapterContents.length; i++) {
    String chapterContent = chapterContents[i];
    String chapterName = chapterNames[i];
    int chapterNumber = i + 1;
    int id = ids[i];
    List<String> paragraphs = chapterContent.split('\n');
    List<String> words = [];
    List<String> wordSpacing = [];
    for (String paragraph in paragraphs) {
      paragraph = paragraph.trimRight();
      if (paragraph.trim().isEmpty) {
        words.add('\n');
        wordSpacing.add('');
        continue;
      }
      String currentWord = '';
      String currentSpacing = '';
      bool inWord = false;
      for (int j = 0; j < paragraph.length; j++) {
        String char = paragraph[j];
        if (char.trim().isNotEmpty) {
          currentWord += char;
          inWord = true;
        } else {
          if (inWord) {
            words.add(currentWord);
            wordSpacing.add(currentSpacing + char);
            currentWord = '';
            currentSpacing = '';
            inWord = false;
          } else {
            currentSpacing += char;
          }
        }
      }
      if (currentWord.isNotEmpty) {
        words.add(currentWord);
        wordSpacing.add(currentSpacing + '\n');
      }
    }
    for (int wordIndex = 0;
        wordIndex < words.length;
        wordIndex += wordsPerPage) {
      int endWordIndex = math.min(wordIndex + wordsPerPage, words.length);
      String pageContent = '';
      for (int w = wordIndex; w < endWordIndex; w++) {
        String word = words[w];
        String spacing = w < wordSpacing.length ? wordSpacing[w] : ' ';
        pageContent += word == '\n' ? '\n' : word + spacing;
      }
      pages.add({
        'pageNumber': pageNumber,
        'chapterNumber': chapterNumber,
        'id': id,
        'chapterName': chapterName,
        'content': pageContent.trimRight(),
        'firstPageOfChapter': wordIndex == 0,
      });
      pageNumber++;
    }
  }
  return pages;
}

int? returnCharacterCount(String? blurb) {
  // take the string and return the number of characters
  if (blurb == null) {
    return null;
  }
  return blurb.length;
}

int? combineImpressions(
  int? promo,
  int? organic,
) {
  // Take the promo and organic values and add them together.
  if (promo == null || organic == null) {
    return null;
  }

  return promo + organic;
}

DateTime? returnYesterdaysDate(DateTime? currentTime) {
  // take the currentTime and return yesterday's time minus 1 minute
  if (currentTime != null) {
    return currentTime.subtract(Duration(days: 1, minutes: 1));
  }
  return null;
}

DateTime? getDateUsingVar(
  DateTime? currentTime,
  int? daysFrom,
) {
  // Return the very start of day that is "daysFrom" the currentDay taken from "currentTime"
  if (currentTime == null || daysFrom == null) {
    return null;
  }

  DateTime currentDay = DateTime.utc(
    currentTime.year,
    currentTime.month,
    currentTime.day,
  );

  return currentDay.subtract(Duration(days: daysFrom));
}

int getIndexOfUserBook(
  int bookId,
  List<UserBooksDataStruct> userBooksData,
) {
  return userBooksData.indexWhere((e) => e!.userbookId == bookId);
}

DateTime? getDailyPassResetTime(DateTime? dailyPassLastActive) {
  // take the dailyPassLastActive and return 24 hours in the future.
  if (dailyPassLastActive != null) {
    return dailyPassLastActive.add(Duration(hours: 24));
  }
  return null;
}

DateTime? getTime() {
  DateTime now = DateTime.now();
  DateTime futureTime = now.add(Duration(seconds: 10));
  return futureTime;
}

int? getTotalDiscount(
  int? chapters,
  double? pricePerChapter,
) {
  // take the chapter number and multiple by price per chapter to return the final value.
  if (chapters != null && pricePerChapter != null) {
    return (chapters * pricePerChapter).toInt();
  } else {
    return null;
  }
}

int? calculateDiscountedCoins(
  int bulkChapterNumber,
  double costPerChapter,
  double discountPercentage,
) {
  final totalCoins = bulkChapterNumber * costPerChapter;
  final discountApplied = totalCoins * (discountPercentage / 100);
  final discountedCoins = totalCoins - discountApplied;

  return discountedCoins.toInt();
}

int calculateFreeChaptersCount(List<ChaptersRow> chapters) {
  return chapters.where((e) => !(e.paymentRequired ?? false)).length;
}
