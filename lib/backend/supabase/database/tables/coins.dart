import '../database.dart';

class CoinsTable extends SupabaseTable<CoinsRow> {
  @override
  String get tableName => 'coins';

  @override
  CoinsRow createRow(Map<String, dynamic> data) => CoinsRow(data);
}

class CoinsRow extends SupabaseDataRow {
  CoinsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CoinsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get firebaseUserId => getField<String>('firebase_user_id');
  set firebaseUserId(String? value) =>
      setField<String>('firebase_user_id', value);

  int? get balance => getField<int>('balance');
  set balance(int? value) => setField<int>('balance', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get sparkeCoins => getField<int>('sparke_coins');
  set sparkeCoins(int? value) => setField<int>('sparke_coins', value);

  int? get purchasedCoins => getField<int>('purchased_coins');
  set purchasedCoins(int? value) => setField<int>('purchased_coins', value);
}
