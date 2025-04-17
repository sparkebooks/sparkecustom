import '../database.dart';

class CoinPackagesTable extends SupabaseTable<CoinPackagesRow> {
  @override
  String get tableName => 'coin_packages';

  @override
  CoinPackagesRow createRow(Map<String, dynamic> data) => CoinPackagesRow(data);
}

class CoinPackagesRow extends SupabaseDataRow {
  CoinPackagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CoinPackagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get revenuecatPackageId => getField<String>('revenuecat_package_id')!;
  set revenuecatPackageId(String value) =>
      setField<String>('revenuecat_package_id', value);

  int get baseCoins => getField<int>('base_coins')!;
  set baseCoins(int value) => setField<int>('base_coins', value);

  int get bonusCoins => getField<int>('bonus_coins')!;
  set bonusCoins(int value) => setField<int>('bonus_coins', value);

  double get price => getField<double>('price')!;
  set price(double value) => setField<double>('price', value);

  bool get isMostPopular => getField<bool>('is_most_popular')!;
  set isMostPopular(bool value) => setField<bool>('is_most_popular', value);

  bool get active => getField<bool>('active')!;
  set active(bool value) => setField<bool>('active', value);

  int? get discountPercent => getField<int>('discount_percent');
  set discountPercent(int? value) => setField<int>('discount_percent', value);

  int get index => getField<int>('index')!;
  set index(int value) => setField<int>('index', value);
}
