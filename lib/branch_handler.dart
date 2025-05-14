import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';

import 'auth/firebase_auth/auth_util.dart';
import 'backend/schema/users_record.dart';
import 'backend/schema/util/firestore_util.dart';
import 'flutter_flow/custom_functions.dart';
import 'flutter_flow/flutter_flow_util.dart' as ff;
import 'flutter_flow/random_data_util.dart';
import 'sparke_books/sparke_books_widget.dart'; // Adjust the import path if necessary

class BranchLinksHandler extends StatefulWidget {
  const BranchLinksHandler({
    super.key, // Correct modern syntax usage
    required this.router,
    required this.child,
  });

  final ff.GoRouter router;
  final Widget child;

  @override
  BranchLinksHandlerState createState() => BranchLinksHandlerState();
}

class BranchLinksHandlerState extends State<BranchLinksHandler> {
  StreamSubscription<Map>? branchSubscription;
  bool _isLoading = false;

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
            _navigateToBook(bookId: bookId, chapterId: chapterId);
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

  Future<void> _navigateToBook({
    required String bookId,
    required String? chapterId,
  }) async {
    if (FirebaseAuth.instance.currentUser == null) {
      try {
        setState(() => _isLoading = true);
        widget.router.prepareAuthEvent();
        await _createAnonymousUser(context: context);
        if (mounted) setState(() => _isLoading = false);
      } catch (e, s) {
        if (mounted) setState(() => _isLoading = false);
        log('Error creating anonymous user with pre-set troops',
            error: e, stackTrace: s);
        return;
      }
    }
    if (!mounted) return;
    widget.router.pushNamed(
      SparkeBooksWidget.routeName,
      queryParameters: {
        'bookId': bookId,
        'chapterId': chapterId,
        'isFromDeepLink': 'true',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      textDirection: TextDirection.ltr,
      fit: StackFit.expand,
      children: [
        widget.child,
        if (_isLoading) Center(child: CircularProgressIndicator()),
      ],
    );
  }
}

Future<void> _createAnonymousUser({
  required BuildContext context,
}) async {
  await authManager.signInAnonymously(context);
  await UsersRecord.collection.doc(currentUser!.uid).update({
    ...createUsersRecordData(
      displayName: 'Guest ${randomInteger(100000, 999999).toString()}',
      totalBooks: 0,
      haveRead: false,
      anonymousUser: true,
      lastActiveTime: ff.getCurrentTimestamp,
      lastReadNotification: ff.getCurrentTimestamp,
      dailyPassLastActive: returnYesterdaysDate(ff.getCurrentTimestamp),
    ),
    ...mapToFirestore(
      {
        'selected_tropes': _presetTroops,
      },
    ),
  });
}

final _presetTroops = [
  'Age Gap',
  'CEO/Billionaire',
  'Alpha/Omega (Werewolves)',
  'Forced Proximity',
  'Fantasy',
  'Friends-to-Lovers',
  'Enemies-to-Lovers',
  'Dark Romance',
  'Small Town',
  'Mafia',
];
