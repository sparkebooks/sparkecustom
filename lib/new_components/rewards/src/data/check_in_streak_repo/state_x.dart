import 'package:sparke_kaleo/new_components/rewards/src/data/check_in_streak_repo/state.dart';

extension StreakStateX on StreakState {
  bool get isCurrentlyLost =>
      lastCheckIn != null &&
      DateTime.now().dayNumber - lastCheckIn!.dayNumber > 1;

  bool get didCheckInToday =>
      lastCheckIn != null && lastCheckIn!.dayNumber == DateTime.now().dayNumber;
}

extension on DateTime {
  int get dayNumber {
    final t0 = DateTime(0);
    return difference(t0).inDays;
  }
}
