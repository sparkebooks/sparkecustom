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

/// Custom action to handle backwards page navigation in a book reading app
/// Returns different status strings based on navigation result
/// @param context - BuildContext for showing messages
/// @param currentPageNumber - Current page being viewed
/// @param currentChapterIndex - Current chapter index in the book
/// @param bookId - ID of the current book
/// @param chapterId - ID of the current chapter
Future<String> customBackwardNav(
  BuildContext context,
  int currentPageNumber,
  int currentChapterIndex,
  String bookId,
  String chapterId,
) async {
  final supabase = SupaFlow.client;

  try {
    // Check if we're at the first page of the book
    if (currentPageNumber == 1) {
      return 'at_beginning';
    }

    // Check if we're at the first page of current chapter
    if (currentChapterIndex == 1) {
      // Get previous chapter details
      final previousChapterId = (int.parse(chapterId) - 1).toString();
      final previousChapterResponse = await supabase
          .from('chapters')
          .select('num_pages')
          .eq('id', previousChapterId)
          .single();

      // Return error if previous chapter not found
      if (previousChapterResponse == null) {
        return 'error_chapter_not_found';
      }

      // Get the number of pages in the previous chapter
      final previousChapterPages = previousChapterResponse['num_pages'] as int;

      // Move to last page of previous chapter
      await supabase.from('user_books').update({
        'chapter_index': previousChapterPages,
        'page_number': currentPageNumber - 1,
        'chapter_id': previousChapterId,
      }).eq('id', bookId);

      return 'previous_chapter';
    }

    // Normal page turn backwards - decrement chapter index and page number
    await supabase.from('user_books').update({
      'chapter_index': currentChapterIndex - 1,
      'page_number': currentPageNumber - 1,
    }).eq('id', bookId);

    return 'success';
  } catch (e) {
    // Return error for any exceptions
    return 'error';
  }
}
