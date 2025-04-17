// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

List<String> calculateBookPages(
  String content,
  double fontSize,
  double screenHeight,
  double screenWidth,
  double horizontalPadding,
  double verticalPadding,
) {
  double minSpaceForNextWord = 24.0;
  final TextPainter textPainter = TextPainter(
    // textDirection: TextDirection.LTR,
    maxLines: null,
  );

  final availableWidth = screenWidth - horizontalPadding;
  final availableHeight = screenHeight - verticalPadding;
  // final availableWidth = screenSize.width - padding.horizontal;
  // final availableHeight = screenSize.height - padding.vertical - 16;

  final List<String> pages = [];
  final words = content.split(' ');
  List<String> currentPageWords = [];
  String previousValidPage = '';

  for (int i = 0; i < words.length; i++) {
    currentPageWords.add(words[i]);

    textPainter.text = TextSpan(
      text: currentPageWords.join(' '),
      style: TextStyle(
        fontSize: fontSize,
        height: 1.5,
      ),
    );

    textPainter.layout(maxWidth: availableWidth);

    if (textPainter.height > availableHeight) {
      if (currentPageWords.length == 1) {
        // Handle case where a single word is too long
        final String word = currentPageWords[0];
        int splitIndex = _findSplitIndex(
          word,
          textPainter,
          availableHeight,
          availableWidth,
          fontSize,
        );
        pages.add(word.substring(0, splitIndex));
        words.insert(i + 1, word.substring(splitIndex));
        currentPageWords.clear();
        continue;
      }

      // Remove overflow word and check if it would cause minimal overflow
      currentPageWords.removeLast();
      if (i + 1 < words.length) {
        List<String> nextWordTest = List.from(currentPageWords);
        nextWordTest.add(words[i]);

        textPainter.text = TextSpan(
          text: nextWordTest.join(' '),
          style: TextStyle(
            fontSize: fontSize,
            height: 1.5,
          ),
        );

        textPainter.layout(maxWidth: availableWidth);

        if (textPainter.height <= availableHeight + minSpaceForNextWord) {
          currentPageWords.add(words[i]);
          i++;
        }
      }

      String pageContent = currentPageWords.join(' ');

      if (pageContent.isNotEmpty) {
        pages.add(pageContent);
        previousValidPage = pageContent;
        currentPageWords = [];
        i--;
      } else {
        pages.add(previousValidPage);
        currentPageWords = [words[i]];
      }
    }
  }

  if (currentPageWords.isNotEmpty) {
    pages.add(currentPageWords.join(' '));
  }

  return pages;
}

int _findSplitIndex(String word, TextPainter painter, double maxHeight,
    double maxWidth, double? fontSize) {
  int low = 0;
  int high = word.length;

  while (low < high) {
    int mid = (low + high) ~/ 2;

    painter.text = TextSpan(
      text: word.substring(0, mid),
      style: TextStyle(
        fontSize: fontSize,
        height: 1.5,
      ),
    );

    painter.layout(maxWidth: maxWidth);

    if (painter.height <= maxHeight) {
      low = mid + 1;
    } else {
      high = mid;
    }
  }

  return low - 1;
}
