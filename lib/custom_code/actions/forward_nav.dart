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

Future<String> forwardNav(
  int currentPageNumber,
  bool firstChapterNext,
  int currentChapter,
  int totalPages,
  String userBook,
) async {
  final supabase = SupaFlow.client;
  if (currentPageNumber >= totalPages) {
    return 'end_of_book';
  }
  int newPageNumber = currentPageNumber + 1;
  int newChapter = currentChapter + 1;
  if (firstChapterNext) {
    try {
      final chapterResponse = await supabase
          .from('chapters')
          .select('payment_required')
          .eq('id', newChapter.toString())
          .single();
      if (chapterResponse != null &&
          chapterResponse['payment_required'] == true) {
        final userBookResponse = await supabase
            .from('user_books')
            .select('chapters_unlocked')
            .eq('id', userBook)
            .single();
        if (userBookResponse != null &&
            userBookResponse['chapters_unlocked'] >= 1) {
          try {
            await supabase.from('user_books').update({
              'page_number': newPageNumber,
              'chapter_id': newChapter.toString(),
              'chapters_unlocked': userBookResponse['chapters_unlocked'] - 1,
              'updated_at': DateTime.now().toIso8601String(),
            }).eq('id', userBook);
            return 'new_chapter';
          } catch (e) {
            return 'error: ${e.toString()}';
          }
        } else {
          return 'payment_required';
        }
      }
      await supabase.from('user_books').update({
        'page_number': newPageNumber,
        'chapter_id': newChapter.toString(),
        'updated_at': DateTime.now().toIso8601String(),
      }).eq('id', userBook);
      return 'new_chapter';
    } catch (e) {
      return 'error: ${e.toString()}';
    }
  }
  try {
    await supabase.from('user_books').update({
      'page_number': newPageNumber,
      'chapter_id': currentChapter.toString(),
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', userBook);
    return 'success';
  } catch (e) {
    return 'error: ${e.toString()}';
  }
}
