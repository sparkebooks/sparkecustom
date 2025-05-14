import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

void openTermsOfUsePage() {
  _launchUrl('https://www.sparkebooks.com/terms-of-service');
}

void openPrivacyPolicyPage() {
  _launchUrl('https://www.sparkebooks.com/privacy');
}

void openAboutPage() {
  _launchUrl('https://www.sparkebooks.com');
}

Future<void> _launchUrl(String url) async {
  try {
    final res = await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
    );
    if (!res) throw res;
  } catch (e, s) {
    log('Error launching $url', error: e, stackTrace: s);
  }
}
