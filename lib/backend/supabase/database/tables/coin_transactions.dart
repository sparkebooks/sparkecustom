import '../database.dart';

class CoinTransactionsTable extends SupabaseTable<CoinTransactionsRow> {
  @override
  String get tableName => 'coin_transactions';

  @override
  CoinTransactionsRow createRow(Map<String, dynamic> data) =>
      CoinTransactionsRow(data);
}

class CoinTransactionsRow extends SupabaseDataRow {
  CoinTransactionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CoinTransactionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get firebaseUid => getField<String>('firebase_uid')!;
  set firebaseUid(String value) => setField<String>('firebase_uid', value);

  int get amount => getField<int>('amount')!;
  set amount(int value) => setField<int>('amount', value);

  String get transactionType => getField<String>('transaction_type')!;
  set transactionType(String value) =>
      setField<String>('transaction_type', value);

  int? get purchaseId => getField<int>('purchase_id');
  set purchaseId(int? value) => setField<int>('purchase_id', value);

  int? get chapterId => getField<int>('chapter_id');
  set chapterId(int? value) => setField<int>('chapter_id', value);

  bool get isPaidCoin => getField<bool>('is_paid_coin')!;
  set isPaidCoin(bool value) => setField<bool>('is_paid_coin', value);

  DateTime? get refundableUntil => getField<DateTime>('refundable_until');
  set refundableUntil(DateTime? value) =>
      setField<DateTime>('refundable_until', value);

  int? get paidCoinsSpent => getField<int>('paid_coins_spent');
  set paidCoinsSpent(int? value) => setField<int>('paid_coins_spent', value);

  int? get sparkeCoinsSpent => getField<int>('sparke_coins_spent');
  set sparkeCoinsSpent(int? value) =>
      setField<int>('sparke_coins_spent', value);

  double? get monetaryValue => getField<double>('monetary_value');
  set monetaryValue(double? value) => setField<double>('monetary_value', value);
}
