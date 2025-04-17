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

Future<dynamic> getMetaData(
  String bookId,
) async {
  try {
    final supabase = SupaFlow.client;
    // Get chapters data for the book
    final chaptersResponse = await supabase
        .from('chapters')
        .select('id, content')
        .eq('book_id', bookId)
        .order('id');

    List<Map<String, dynamic>> chapters =
        List<Map<String, dynamic>>.from(chaptersResponse);

    int totalPages = 0;
    List<int> firstChapterPage = [1]; // First page is always a chapter start

    // Process each chapter
    for (var chapter in chapters) {
      String content = chapter['content'] as String;
      int wordCount = content.split(' ').length;

      // Calculate number of pages for this chapter (250 words per page)
      int chapterPages = (wordCount / 250).ceil();

      // If not the first chapter, add the start page of this chapter to firstChapterPage
      if (totalPages > 0) {
        firstChapterPage.add(totalPages + 1);
      }

      totalPages += chapterPages;
    }

    return [
      {'total_pages': totalPages, 'first_chapter_page': firstChapterPage}
    ];
  } catch (e) {
    return [
      {'total_pages': 0, 'first_chapter_page': []}
    ];
  }
}
