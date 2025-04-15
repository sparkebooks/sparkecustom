import '../database.dart';

class CoinProductOptionsTable extends SupabaseTable<CoinProductOptionsRow> {
  @override
  String get tableName => 'coin_product_options';

  @override
  CoinProductOptionsRow createRow(Map<String, dynamic> data) =>
      CoinProductOptionsRow(data);
}

class CoinProductOptionsRow extends SupabaseDataRow {
  CoinProductOptionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CoinProductOptionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get packageName => getField<String>('package_name');
  set packageName(String? value) => setField<String>('package_name', value);

  String? get packageDescription => getField<String>('package_description');
  set packageDescription(String? value) =>
      setField<String>('package_description', value);

  int? get coinAmount => getField<int>('coin_amount');
  set coinAmount(int? value) => setField<int>('coin_amount', value);

  int? get coinBonus => getField<int>('coin_bonus');
  set coinBonus(int? value) => setField<int>('coin_bonus', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  bool? get featured => getField<bool>('featured');
  set featured(bool? value) => setField<bool>('featured', value);

  int? get timesRedeemed => getField<int>('times_redeemed');
  set timesRedeemed(int? value) => setField<int>('times_redeemed', value);

  String? get firebaseUserId => getField<String>('firebase_user_id');
  set firebaseUserId(String? value) =>
      setField<String>('firebase_user_id', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);
}
