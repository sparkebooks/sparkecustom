import 'data/check_in_streak_repo/state.dart';
import 'data/check_in_streak_repo/state_x.dart';
import 'state.dart';

extension StreakStateX on StreakState {
  StreakData convert() => StreakData(
        nDays: nDays,
        didCheckInToday: didCheckInToday,
      );
}
