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

/// Custom action to handle page navigation in a book reading app
/// Returns different status strings based on navigation result
/// @param context - BuildContext for showing messages
/// @param totalPages - Total pages in the book
/// @param currentPageNumber - Current page being viewed
/// @param numOfPages - Number of pages in current chapter
/// @param currentChapterIndex - Current chapter index
/// @param bookId - ID of the current book
/// @param chapterId - ID of the current chapter
/// @param chaptersUnlocked - Number of chapters user has unlocked
Future<String> customPageNavigation(
  BuildContext context,
  int totalPages,
  int currentPageNumber,
  int numOfPages,
  int currentChapterIndex,
  String bookId,
  String chapterId,
  int chaptersUnlocked,
) async {
  // Initialize Supabase client
  final supabase = SupaFlow.client;

  try {
    // Check if we're at the last page of the book
    if (totalPages == currentPageNumber) {
      // Get next chapter details
      final nextChapterResponse =
          await supabase.from('chapters').select().eq('id', chapterId).single();

      // Return error if chapter not found
      if (nextChapterResponse == null) return 'error_chapter_not_found';

      // Check if chapter requires payment
      bool paymentRequired = nextChapterResponse['payment_required'] ?? false;
      if (paymentRequired) return 'payment_required';

      // Update user's book progress and decrement unlocked chapters
      await supabase.from('user_books').update({
        'chapter_index': currentChapterIndex + 1,
        'page_number': currentPageNumber + 1,
        'chapters_unlocked': chaptersUnlocked - 1,
      }).eq('id', bookId);

      return 'next_chapter';
    }

    // Check if we're at the last page of current chapter
    if (numOfPages == currentChapterIndex) {
      // Calculate next chapter ID
      int nextChapterId = int.parse(chapterId) + 1;

      // Reset chapter index to 1, increment page, and update chapter ID
      await supabase.from('user_books').update({
        'chapter_index': 1,
        'page_number': currentPageNumber + 1,
        'chapter_id': nextChapterId.toString(),
      }).eq('id', bookId);

      return 'chapter_reset';
    }

    // Normal page turn - increment chapter index and page number
    await supabase.from('user_books').update({
      'chapter_index': currentChapterIndex + 1,
      'page_number': currentPageNumber + 1,
    }).eq('id', bookId);

    return 'success';
  } catch (e) {
    // Return error for any exceptions
    return 'error';
  }
}
