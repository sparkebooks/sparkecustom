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

import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:advertising_id/advertising_id.dart';

/// Set your action name, define your arguments and return parameter,
/// and then add the boilerplate code using the green button on the right!
Future<String> getAdvertiserId() async {
  String advertisingId = '';

  try {
    if (Platform.isIOS) {
      // Request tracking authorization on iOS
      var status = await AppTrackingTransparency.requestTrackingAuthorization();
      if (status == TrackingStatus.authorized) {
        advertisingId =
            await AppTrackingTransparency.getAdvertisingIdentifier();
      }
    } else if (Platform.isAndroid) {
      // On Android, get the advertising ID
      advertisingId = await AdvertisingId.id(true) ?? '';
    }
  } catch (e) {
    print('Failed to get advertising ID: $e');
  }

  return advertisingId;
}
