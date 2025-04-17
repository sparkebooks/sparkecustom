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

Future<bool> badWordCheckAction(
  String comment,
  List<String> badWords,
) async {
  final lowerComment = comment.toLowerCase();

  // Check for specific domain extensions and URL shorteners
  final domainPatterns = ['.com', '.net', '.org', 'bit.ly'];
  for (final pattern in domainPatterns) {
    if (lowerComment.contains(pattern)) {
      return true;
    }
  }

  // Check for bad words
  for (final badWord in badWords) {
    final lowerBadWord = badWord.toLowerCase();
    // Check for the word as is
    if (lowerComment.contains(lowerBadWord)) {
      return true;
    }
    // Check for the word with spaces in between
    final spacedBadWord = lowerBadWord.split('').join(r'\s*');
    final regExp = RegExp(r'\b' + spacedBadWord + r'\b', caseSensitive: false);
    if (regExp.hasMatch(lowerComment)) {
      return true;
    }
  }

  return false;
}
