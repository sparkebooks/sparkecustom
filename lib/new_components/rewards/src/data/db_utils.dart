import 'package:sparke_kaleo/backend/supabase/supabase.dart';

class DbUtils {
  static Future<CoinsRow> getOrCreateCoinsEntry(
      {required String userId}) async {
    final res = await CoinsTable().queryRows(
      queryFn: (q) => q.eqOrNull(
        'firebase_user_id',
        userId,
      ),
    );
    if (res.isNotEmpty) {
      return res.first;
    } else {
      await CoinsTable().insert({
        'balance': 0,
        'firebase_user_id': userId,
      });
      return CoinsRow({});
    }
  }

  static Future<void> incrementCoinBalance(
      {required String userId, required int nCoins}) async {
    final res = await getOrCreateCoinsEntry(userId: userId);
    await CoinsTable().update(
      data: {'balance': (res.balance ?? 0) + nCoins},
      matchingRows: (rows) => rows.eqOrNull('firebase_user_id', userId),
    );
  }
}
