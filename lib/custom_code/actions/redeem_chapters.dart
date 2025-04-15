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

Future<bool> redeemChapters(
  String userId,
  int bookId,
  int numberOfChapters,
  int coinsPerChapter,
  int userBookId,
) async {
  // try {
  //   final _supabase = Supabase.instance.client;
  //   final response = await _supabase.rpc(
  //     'redeem_chapters',
  //     params: {
  //       'p_user_id': userId,
  //       'p_book_id': bookId,
  //       'p_number_of_chapters': numberOfChapters,
  //       'p_coins_per_chapter': coinsPerChapter,
  //     },
  //   );
  //   return response['success'];
  // } catch (e) {
  //   throw 'Failed to redeem chapters: $e';
  // }
  try {
    final _supabase = Supabase.instance.client;
    // First get current state
    final currentState = await _supabase
        .from('user_books')
        .select('chapters_unlocked, id')
        .eq('firebase_user_id', userId)
        .eq('book_id', bookId)
        .single();

    print(
        'Before unlock - Chapters unlocked: ${currentState['chapters_unlocked']}');

    final response = await _supabase.rpc(
      'unlock_bulk_chapters',
      params: {
        'p_user_id': userId,
        'p_book_id': bookId,
        'p_num_chapters': numberOfChapters,
        'p_user_book_id': userBookId
      },
    );

    print('Unlock response: $response');

    // Verify the update
    final newState = await _supabase
        .from('user_books')
        .select('chapters_unlocked')
        .eq('firebase_user_id', userId)
        .eq('book_id', bookId)
        .single();

    print('After unlock - Chapters unlocked: ${newState['chapters_unlocked']}');

    // if (response['success'] == true) {
    //   return response['success'];
    // } else {
    //   throw Exception(response['message']);
    // }

    return response['success'];
  } catch (e) {
    print('Error unlocking chapters: $e');
    return false;
  }
}
