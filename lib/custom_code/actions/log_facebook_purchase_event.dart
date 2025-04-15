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

import 'package:sparke_kaleo/auth/base_auth_user_provider.dart';

import 'dart:developer';

import 'dart:io';

import 'package:facebook_app_events/facebook_app_events.dart';

import 'index.dart'; // Imports other custom actions

Future logFacebookPurchaseEvent(
  double price,
  String priceInString,
  String currencyCode,
  int coinAmount,
) async {
  // Add your function code here!
  try {
    FacebookAppEvents().logPurchase(
      amount: price,
      currency: currencyCode,
      parameters: {
        // Transaction Details
        'fb_content_type': 'in_app_purchase',

        // Product Specifics
        'product_name': 'Coin Package',
        'product_price': priceInString,
        'coin_amount': coinAmount,

        // User Identifiers - Critical for matching purchases to users
        'user_id': currentUser!.uid,
        'user_email': currentUser!.email,
        'advertiser_id':
            await getAdvertiserId(), // IDFA/AAID with proper consent

        // Purchase Context
        'purchase_time': DateTime.now().toIso8601String(),

        // Platform Specific
        'platform': Platform.isIOS ? 'iOS' : 'Android',
        'locale': Platform.localeName,
        'timezone': DateTime.now().timeZoneName,
      },
    );
  } catch (e) {
    log('Could not log the FB Purchase event', error: e);
  }
}
