import 'package:flutter/material.dart';
import 'package:sparke_kaleo/auth/firebase_auth/auth_util.dart';
import 'package:sparke_kaleo/new_components/rewards/src/dependencies.dart';

import '../../main.dart';
import 'src/screen.dart' as src;

extension RewardsScreenNavigatorX on NavigatorState {
  void pushRewardsScreen() => push(MaterialPageRoute(
        builder: (context) => RewardsScreen(),
      ));
}

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  late final _dependencies = adMob == null
      ? null
      : RewardsScreenDependencies.create(
          currentUser: () => currentUserDocument,
          userStream: authenticatedUserStream,
          adMob: adMob!,
          sharedPreferences: sharedPreferences,
          inAppReviewManager: inAppReviewManager,
        );

  @override
  Widget build(BuildContext context) {
    final deps = _dependencies;
    return deps == null
        ? Center(child: Text('Not supported on web'))
        : src.RewardsScreen(blocBuilder: deps.blocBuilder);
  }
}
