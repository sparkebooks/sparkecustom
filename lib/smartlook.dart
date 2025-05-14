import 'package:flutter_smartlook/flutter_smartlook.dart';

Future<void> startSmartlook() async {
  final smartlook = Smartlook.instance;
  await smartlook.sensitivity.changeNativeClassSensitivity([
    SensitivityTuple(
      classType: SmartlookNativeClassSensitivity.WebView,
      isSensitive: true,
    ),
    SensitivityTuple(
      classType: SmartlookNativeClassSensitivity.WKWebView,
      isSensitive: true,
    ),
  ]);
  smartlook.preferences
      .setProjectKey('44224deda9b0ac7989939e37f05242ecf88a0fb5');
  smartlook.start();
}
