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

Future<List<dynamic>> getUserBookData(
  String userBookId,
) async {
  try {
    final supabase = SupaFlow.client;
    // Get user book data
    final response = await supabase
        .from('user_book') // your table name
        .select('page_number, chapter_id, chapters_unlocked')
        .eq('id', userBookId)
        .single();

    // Return the data in the required format
    return [
      {
        'currentPageNumber': response['page_number'],
        'currentChapter': response['chapter_id'],
        'chaptersUnlocked': response['chapters_unlocked']
      }
    ];
  } catch (e) {
    // Return default values in case of error
    return [
      {
        'currentPageNumber': 1,
        'user_book_id': userBookId,
        'currentChapter': 1,
        'chaptersUnlocked': 1
      }
    ];
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
