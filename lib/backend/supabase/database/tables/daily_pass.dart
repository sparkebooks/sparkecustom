import '../database.dart';

class DailyPassTable extends SupabaseTable<DailyPassRow> {
  @override
  String get tableName => 'daily_pass';

  @override
  DailyPassRow createRow(Map<String, dynamic> data) => DailyPassRow(data);
}

class DailyPassRow extends SupabaseDataRow {
  DailyPassRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DailyPassTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get firebaseUserId => getField<String>('firebase_user_id');
  set firebaseUserId(String? value) =>
      setField<String>('firebase_user_id', value);

  DateTime? get lastClaimed => getField<DateTime>('last_claimed');
  set lastClaimed(DateTime? value) => setField<DateTime>('last_claimed', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
