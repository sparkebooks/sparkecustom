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
Future<bool> incrementChaptersUnlockedBy1(
  String userId,
  int bookId,
) async {
  final supabase = Supabase.instance.client;
  try {
    final bool response = await supabase.rpc('unlock_one_chapter', params: {
      'p_user_id': userId,
      'p_book_id': bookId,
    });
    return response;
  } catch (error) {
    print('Error incrementing chapters_unlocked: $error');
    return false;
  } finally {
    print('Incremented chapters_unlocked by 1');
  }
}
