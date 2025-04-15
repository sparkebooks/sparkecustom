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

import 'package:firebase_auth/firebase_auth.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> setupFCMTokenInSupabase() async {
  final firebaseUser = FirebaseAuth.instance.currentUser;
  if (firebaseUser != null) {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      final supabase = Supabase.instance.client;
      await supabase.from('fcm_tokens').upsert({
        'firebase_uid': firebaseUser.uid,
        'token': token,
        'updated_at': DateTime.now().toIso8601String(),
      });
    }
  }
}
