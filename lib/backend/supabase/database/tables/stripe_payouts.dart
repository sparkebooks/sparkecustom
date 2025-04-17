import '../database.dart';

class StripePayoutsTable extends SupabaseTable<StripePayoutsRow> {
  @override
  String get tableName => 'stripe_payouts';

  @override
  StripePayoutsRow createRow(Map<String, dynamic> data) =>
      StripePayoutsRow(data);
}

class StripePayoutsRow extends SupabaseDataRow {
  StripePayoutsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StripePayoutsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get transferId => getField<String>('transfer_id');
  set transferId(String? value) => setField<String>('transfer_id', value);

  int? get amount => getField<int>('amount');
  set amount(int? value) => setField<int>('amount', value);

  String? get currency => getField<String>('currency');
  set currency(String? value) => setField<String>('currency', value);

  String? get destination => getField<String>('destination');
  set destination(String? value) => setField<String>('destination', value);

  String? get transferGroup => getField<String>('transfer_group');
  set transferGroup(String? value) => setField<String>('transfer_group', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get errorMessage => getField<String>('error_message');
  set errorMessage(String? value) => setField<String>('error_message', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get firebaseUserId => getField<String>('firebase_user_id');
  set firebaseUserId(String? value) =>
      setField<String>('firebase_user_id', value);

  int? get bookId => getField<int>('book_id');
  set bookId(int? value) => setField<int>('book_id', value);

  String? get payoutType => getField<String>('payout_type');
  set payoutType(String? value) => setField<String>('payout_type', value);

  DateTime? get earningsPeriodStart =>
      getField<DateTime>('earnings_period_start');
  set earningsPeriodStart(DateTime? value) =>
      setField<DateTime>('earnings_period_start', value);

  DateTime? get earningsPeriodEnd => getField<DateTime>('earnings_period_end');
  set earningsPeriodEnd(DateTime? value) =>
      setField<DateTime>('earnings_period_end', value);
}
