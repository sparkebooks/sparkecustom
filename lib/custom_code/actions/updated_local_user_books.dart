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

Future updatedLocalUserBooks(int id) async {
  // Add your function code here!
  final UserBooksDataStruct recentBook =
      FFAppState().userBooksData.firstWhere((e) => e.userbookId == id);
  FFAppState().update(() {
    FFAppState()
        .userBooksData
        .removeWhere((e) => e.userbookId == recentBook.userbookId);
    FFAppState().userBooksData.insert(0, recentBook);
  });
}
