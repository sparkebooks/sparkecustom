import '../database.dart';

class UserPreferencesTable extends SupabaseTable<UserPreferencesRow> {
  @override
  String get tableName => 'user_preferences';

  @override
  UserPreferencesRow createRow(Map<String, dynamic> data) =>
      UserPreferencesRow(data);
}

class UserPreferencesRow extends SupabaseDataRow {
  UserPreferencesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserPreferencesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  int? get tropeId => getField<int>('trope_id');
  set tropeId(int? value) => setField<int>('trope_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get firebaseUserId => getField<String>('firebase_user_id');
  set firebaseUserId(String? value) =>
      setField<String>('firebase_user_id', value);
}
