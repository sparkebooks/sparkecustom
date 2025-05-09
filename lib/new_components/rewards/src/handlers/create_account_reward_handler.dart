import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sparke_kaleo/auth/firebase_auth/auth_util.dart';

import '../config.dart';
import '../data/db_utils.dart';
import '../utils/show_snack_bar.dart';

/// Detects account creation, grants the award, displays message.
/// Does nothing unless explicitly enabled.
class CreateAccountRewardHandler extends StatefulWidget {
  static bool isEnabled = false;

  final Widget child;
  const CreateAccountRewardHandler({super.key, required this.child});

  @override
  State<CreateAccountRewardHandler> createState() =>
      _CreateAccountRewardHandlerState();
}

class _CreateAccountRewardHandlerState
    extends State<CreateAccountRewardHandler> {
  late final StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    _sub = authenticatedUserStream
        .startWith(currentUserDocument)
        .whereNotNull()
        .pairwise()
        .where((e) => e.first.anonymousUser && !e.last.anonymousUser)
        .map((e) => e.last.uid.isEmpty ? null : e.last.uid)
        .whereNotNull()
        .listen((uid) async {
      if (CreateAccountRewardHandler.isEnabled) {
        CreateAccountRewardHandler.isEnabled = false;
        try {
          await DbUtils.incrementCoinBalance(
              userId: uid, nCoins: createAccountReward);
          if (!mounted) return;
          showRewardSuccessSnackBar(
              context: context, nCoins: createAccountReward);
        } catch (e) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error when granting you a reward\n$e')),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
