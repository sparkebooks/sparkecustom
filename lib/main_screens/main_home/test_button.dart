import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class TestButton extends StatelessWidget {
  const TestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return !kDebugMode
        ? SizedBox.shrink()
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  ConsentInformation.instance.reset();
                },
                icon: Icon(Icons.bug_report),
              ),
            ],
          );
  }
}
