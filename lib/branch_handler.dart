import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:sparke_kaleo/sparke_books/sparke_books_widget.dart';

import '/flutter_flow/nav/nav.dart'; // Adjust the import path if necessary

class BranchLinksHandler extends StatefulWidget {
  const BranchLinksHandler({
    super.key, // Correct modern syntax usage
    required this.router,
    required this.child,
  });

  final GoRouter router;
  final Widget child;

  @override
  _BranchLinksHandlerState createState() => _BranchLinksHandlerState();
}

class _BranchLinksHandlerState extends State<BranchLinksHandler> {
  StreamSubscription<Map>? branchSubscription;

  @override
  void initState() {
    super.initState();
    initBranchIo();
  }

  void initBranchIo() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      branchSubscription = FlutterBranchSdk.listSession().listen((data) {
        if (data.containsKey('book_id')) {
          String bookId = data['book_id'];
          String? chapterId = data['chapter_id'];

          widget.router.pushNamed(
            SparkeBooksWidget.routeName,
            queryParameters: {
              'bookId': bookId,
              'chapterId': chapterId,
              'isFromDeepLink': 'true',
            },
          );
        } else {
          log(
            'No book_id parameter found in the deep link payload.',
            name: 'Branch',
          );
        }
      });
    });

    FlutterBranchSdk.getLatestReferringParams().then((data) {
      if (data.containsKey('+is_first_session')) {
        bool is_first_session = data['+is_first_session'];

        if (is_first_session) {
          if (data.containsKey('book_id')) {
            String bookId = data['book_id'];
            String chapterId = data['chapter_id'];

            widget.router.pushNamed(
              SparkeBooksWidget.routeName,
              queryParameters: {
                'bookId': bookId,
                'chapterId': chapterId,
                'isFromDeepLink': 'true',
              },
            );
          } else {
            log(
              'No book_id parameter found in the deep link payload.',
              name: 'Branch',
            );
          }
        }
      }
    });
  }

  @override
  void dispose() {
    branchSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
