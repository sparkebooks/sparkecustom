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

Future<UsersRecord?> upgradeAnonymousUser(String email, String password) async {
  // Add your function code here!
  // Get current user
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser?.isAnonymous ?? false) {
    try {
      // Create the credential
      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      // Link the anonymous user with the email credential
      final userCredential = await currentUser?.linkWithCredential(credential);
      if (userCredential != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user?.uid)
            .get();
        return UsersRecord.fromSnapshot(userDoc);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
  return null;
}
