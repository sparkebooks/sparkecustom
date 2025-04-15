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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

Future<List<int>> getChapterFirstPages(String bookId) async {
  final supabase = SupaFlow.client;
  List<int> firstPages = [];
  int pageNumber = 1;

  // Query chapters ordered by chapter_order
  final chaptersResponse = await supabase
      .from('chapters')
      .select('content, chapter_order')
      .eq('book_id', bookId)
      .order('chapter_order', ascending: true);

  // Return empty list if no chapters found
  if (chaptersResponse == null || chaptersResponse.isEmpty) {
    return [];
  }

  // Process each chapter
  for (int i = 0; i < chaptersResponse.length; i++) {
    String chapterContent = chaptersResponse[i]['content'] ?? '';
    List<String> words = chapterContent.split(RegExp(r'\s+'));

    // Add current pageNumber since j == 0 (first page of chapter)
    firstPages.add(pageNumber);

    // Process pages like paginateChapterContent
    for (int j = 0; j < words.length; j += 250) {
      int endIndex = j + 250;
      if (endIndex > words.length) {
        endIndex = words.length;
      }
      pageNumber++; // Increment after adding page, exactly like paginateChapterContent
    }
  }

  return firstPages; // Will return [1, 6, 12, 19, 26, 33, ...]
}
