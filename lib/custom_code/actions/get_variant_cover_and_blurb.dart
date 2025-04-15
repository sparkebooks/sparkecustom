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

Future<VariantCoverAndBlurbStruct> getVariantCoverAndBlurb(
  int bookId,
  String userId,
  String? defaultCover,
  String? defaultBlurb,
) async {
  try {
    SupabaseClient supabase = Supabase.instance.client;
    // Try to get variant
    final variant = await supabase.rpc('get_user_variant', params: {
      'p_book_id': bookId,
      'p_user_id': userId,
    }).single();

    // Return variant with fallback to defaults
    return VariantCoverAndBlurbStruct(
      coverImage: variant['cover_image'] ?? defaultCover,
      blurb: variant['blurb'] ?? defaultBlurb,
    );
  } catch (e) {
    // If any error, return default content
    log('Error getting variant cover and blurb: $e');
    return VariantCoverAndBlurbStruct(
      coverImage: defaultCover,
      blurb: defaultBlurb,
    );
  }
}
