import '../database.dart';

class PurchasesTable extends SupabaseTable<PurchasesRow> {
  @override
  String get tableName => 'purchases';

  @override
  PurchasesRow createRow(Map<String, dynamic> data) => PurchasesRow(data);
}

class PurchasesRow extends SupabaseDataRow {
  PurchasesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PurchasesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get bookId => getField<int>('book_id');
  set bookId(int? value) => setField<int>('book_id', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  String? get currency => getField<String>('currency');
  set currency(String? value) => setField<String>('currency', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get firebaseUserId => getField<String>('firebase_user_id');
  set firebaseUserId(String? value) =>
      setField<String>('firebase_user_id', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get coinAmount => getField<int>('coin_amount');
  set coinAmount(int? value) => setField<int>('coin_amount', value);

  bool? get used => getField<bool>('used');
  set used(bool? value) => setField<bool>('used', value);

  int? get paidCoinsSpent => getField<int>('paid_coins_spent');
  set paidCoinsSpent(int? value) => setField<int>('paid_coins_spent', value);

  int? get sparkeCoinsSpent => getField<int>('sparke_coins_spent');
  set sparkeCoinsSpent(int? value) =>
      setField<int>('sparke_coins_spent', value);

  double? get monetaryValue => getField<double>('monetary_value');
  set monetaryValue(double? value) => setField<double>('monetary_value', value);
}
