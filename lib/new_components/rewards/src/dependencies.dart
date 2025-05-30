import 'package:shared_preferences/shared_preferences.dart';
import 'package:sparke_kaleo/new_components/rewards/src/data/check_in_streak_repo/streak_repo.dart';
import 'package:sparke_kaleo/new_components/rewards/src/data/social_media_connection_repo.dart/social_media_connection_repo.dart';

import '../../../ad_mob.dart';
import '../../../backend/schema/users_record.dart';
import '../../../in_app_review_manager/in_app_review_manager.dart';
import 'bloc.dart';

class RewardsScreenDependencies {
  final Bloc Function() blocBuilder;

  RewardsScreenDependencies({required this.blocBuilder});

  static RewardsScreenDependencies create({
    required AdMob adMob,
    required SharedPreferences sharedPreferences,
    required UsersRecord? Function() currentUser,
    required Stream<UsersRecord?> userStream,
    required InAppReviewManager inAppReviewManager,
  }) {
    final checkInStreakRepo =
        CheckInStreakRepo(sharedPreferences: sharedPreferences);
    final socialMediaConnectionRepo =
        SocialMediaConnectionRepo(sharedPreferences: sharedPreferences);
    blocBuilder() => Bloc(
          currentUser: currentUser,
          userStream: userStream,
          adMob: adMob,
          checkInStreakRepo: checkInStreakRepo,
          socialMediaConnectionRepo: socialMediaConnectionRepo,
          inAppReviewManager: inAppReviewManager,
        );
    return RewardsScreenDependencies(blocBuilder: blocBuilder);
  }
}
