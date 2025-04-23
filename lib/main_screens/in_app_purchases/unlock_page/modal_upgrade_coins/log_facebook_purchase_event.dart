// Automatic FlutterFlow imports
import 'dart:developer';
import 'dart:io';

import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:sparke_kaleo/auth/base_auth_user_provider.dart';

Future logFacebookPurchaseEvent(
  double price,
  String priceInString,
  String currencyCode,
  int coinAmount,
) async {
  // Add your function code here!
  try {
    FlutterBranchSdk.trackContent(
      buo: [
        BranchUniversalObject(
          canonicalIdentifier: DateTime.now().toIso8601String(),
          contentMetadata: BranchContentMetaData()
            ..productName = 'Coin Package'
            ..price = 10
            ..addCustomMetadata('fb_content_type', 'in_app_purchase')
            ..addCustomMetadata('product_price', priceInString)
            ..addCustomMetadata('coin_amount', coinAmount)
            ..addCustomMetadata('user_id', currentUser!.uid)
            ..addCustomMetadata('user_email', currentUser!.email)
            ..addCustomMetadata('advertiser_id',
                (await FlutterBranchSdk.getAdvertisingIdentifier()))
            ..addCustomMetadata('platform', Platform.isIOS ? 'iOS' : 'Android')
            ..addCustomMetadata('locale', Platform.localeName)
            ..addCustomMetadata('timezone', DateTime.now().timeZoneName),
        ),
      ],
      branchEvent: BranchEvent.standardEvent(
        BranchStandardEvent.PURCHASE,
      ),
    );
  } catch (e) {
    log('Could not log the FB Purchase event', error: e);
  }
}
