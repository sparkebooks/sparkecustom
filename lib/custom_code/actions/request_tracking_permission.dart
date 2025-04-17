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

import 'package:facebook_app_events/facebook_app_events.dart';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';

Future requestTrackingPermission() async {
  final FacebookAppEvents facebookAppEvents = FacebookAppEvents();
  // Add your function code here!
  // Facebook App Events instance
// Check tracking authorization status
  final TrackingStatus status =
      await AppTrackingTransparency.trackingAuthorizationStatus;

  // Handle Authorized Tracking
  void _handleAuthorizedTracking() {
    // Enable Facebook App Events
    facebookAppEvents.setAutoLogAppEventsEnabled(true);

    // Set Advertiser Tracking Enabled (for iOS versions before 17)
    // Note: This becomes deprecated in iOS 17+
    facebookAppEvents.setAdvertiserTracking(enabled: true);

    // Log app open event with tracking consent
    // facebookAppEvents.logEvent(
    //     name: 'fb_mobile_activate_app',
    //     parameters: {'tracking_enabled': true, 'consent_status': 'authorized'});
  }

  // Handle Denied or Restricted Tracking
  void _handleDeniedTracking() {
    // Disable automatic app events logging
    facebookAppEvents.setAutoLogAppEventsEnabled(false);

    // Set Advertiser Tracking Enabled to false
    facebookAppEvents.setAdvertiserTracking(enabled: false);

    // Log app open event without tracking
    // facebookAppEvents.logEvent(
    //     name: 'fb_mobile_activate_app',
    //     parameters: {'tracking_enabled': false, 'consent_status': 'denied'});
  }

  // Handle Restricted Tracking
  void _handleRestrictedTracking() {
    // Similar to denied tracking, but with a different context
    _handleDeniedTracking();
  }

  // Show Tracking Permission Dialog
  Future<void> _showTrackingPermissionDialog() async {
    // Request tracking authorization
    final TrackingStatus status =
        await AppTrackingTransparency.requestTrackingAuthorization();

    // Handle the result
    switch (status) {
      case TrackingStatus.authorized:
        _handleAuthorizedTracking();
        break;
      default:
        _handleDeniedTracking();
        break;
    }
  }

  switch (status) {
    case TrackingStatus.notDetermined:
      // Request permission
      await _showTrackingPermissionDialog();
      break;
    case TrackingStatus.restricted:
      // Tracking is restricted
      _handleRestrictedTracking();
      break;
    case TrackingStatus.denied:
      // User denied tracking
      _handleDeniedTracking();
      break;
    case TrackingStatus.authorized:
      // User authorized tracking
      _handleAuthorizedTracking();
      break;

    default:
      break;
  }
}
