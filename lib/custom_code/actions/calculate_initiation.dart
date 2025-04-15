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

import 'dart:developer';

import 'package:sparke_kaleo/auth/firebase_auth/auth_util.dart';

Future calculateInitiation(int bookId) async {
  try {
    String userId = currentUserUid;
    SupabaseClient supabase = Supabase.instance.client;
    // Call Supabase SQL query to calculate initiation
    await supabase.rpc('increment_initiations', params: {
      'book_id': bookId,
      'user_id': userId,
    });
  } catch (e) {
    log('Error getting variant cover and blurb: $e');
  }
}
