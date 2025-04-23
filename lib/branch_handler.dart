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
  BranchLinksHandlerState createState() => BranchLinksHandlerState();
}

class BranchLinksHandlerState extends State<BranchLinksHandler> {
  StreamSubscription<Map>? branchSubscription;

  @override
  void initState() {
    super.initState();
    initBranchIo();
  }

  void initBranchIo() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        branchSubscription = FlutterBranchSdk.listSession().listen((data) {
          log('Incoming branch link: $data');
          final clickedBranchLink = data['+clicked_branch_link'] == true;
          final bookId = data['book_id'] as String?;
          final chapterId = data['chapter_id'] as String?;
          if (clickedBranchLink && bookId != null) {
            widget.router.pushNamed(
              SparkeBooksWidget.routeName,
              queryParameters: {
                'bookId': bookId,
                'chapterId': chapterId,
                'isFromDeepLink': 'true',
              },
            );
          }
        }, onError: (e, s) {
          log('Error listening on incoming branch links',
              error: e, stackTrace: s);
        });
      },
    );
  }

  @override
  void dispose() {
    branchSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
