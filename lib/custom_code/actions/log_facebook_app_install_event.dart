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
import 'dart:io';

import 'package:sparke_kaleo/auth/base_auth_user_provider.dart';

import 'package:facebook_app_events/facebook_app_events.dart';

Future logFacebookAppInstallEvent() async {
  // Add your function code here!
  String advertiserId = await getAdvertiserId();
  bool trackingEnabled = advertiserId.isNotEmpty;
  try {
    FacebookAppEvents().logEvent(
      name: 'fb_mobile_app_install',
      parameters: {
        // Device and Platform Information
        'platform': Platform.isIOS ? 'iOS' : 'Android',
        'device_model':
            await getDeviceModel(), // Implement this function to get device info
        'os_version': await getOSVersion(),

        // App Information
        'app_version': await getAppVersion(),

        // User Identifiers - Critical for ad matching
        'locale': Platform.localeName,
        'timezone': DateTime.now().timeZoneName,
        'userID': currentUser!.uid,
        'user_email': currentUser!.email,

        // Mobile Ad ID (IDFA/AAID) - Requires proper consent
        'advertiser_id':
            advertiserId, // Implement to get IDFA/AAID based on platform

        // Tracking Consent
        'tracking_enabled': trackingEnabled, // Only if user has given consent
      },
    );
  } catch (e) {
    log('Could not log the FB Install App event',
        error: e, name: "fb_mobile_app_install event");
  }
}
