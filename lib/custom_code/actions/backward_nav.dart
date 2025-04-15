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

Future<String> backwardNav(
  int currentPageNumber,
  List<int> firstChapterPages,
  int currentChapter,
  int totalPages,
  String userBook,
) async {
  final supabase = SupaFlow.client;
  // Check if we're at the start of the book
  if (currentPageNumber <= 1) {
    return 'start_of_book';
  }
  // Calculate new values
  int newPageNumber = currentPageNumber - 1;
  int newChapter = currentChapter - 1;

  // Check if moving to previous chapter
  if (firstChapterPages.contains(currentPageNumber)) {
    try {
      // Update the database
      await supabase.from('user_books').update({
        'chapter_id': newChapter.toString(),
        'page_number': newPageNumber,
        'updated_at': DateTime.now().toIso8601String(),
      }).eq('id', userBook);
      return 'new_chapter';
    } catch (e) {
      return 'error: ${e.toString()}';
    }
  }

  try {
    // Update the database
    await supabase.from('user_books').update({
      'page_number': newPageNumber,
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', userBook);
    return 'success';
  } catch (e) {
    return 'error: ${e.toString()}';
  }
}
