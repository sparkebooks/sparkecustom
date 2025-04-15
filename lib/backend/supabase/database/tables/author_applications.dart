import '../database.dart';

class AuthorApplicationsTable extends SupabaseTable<AuthorApplicationsRow> {
  @override
  String get tableName => 'author_applications';

  @override
  AuthorApplicationsRow createRow(Map<String, dynamic> data) =>
      AuthorApplicationsRow(data);
}

class AuthorApplicationsRow extends SupabaseDataRow {
  AuthorApplicationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AuthorApplicationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get firebaseUserId => getField<String>('firebase_user_id');
  set firebaseUserId(String? value) =>
      setField<String>('firebase_user_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get lastEditedTime => getField<DateTime>('last_edited_time');
  set lastEditedTime(DateTime? value) =>
      setField<DateTime>('last_edited_time', value);
}
