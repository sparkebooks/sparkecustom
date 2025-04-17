import '../database.dart';

class UserCommentsTable extends SupabaseTable<UserCommentsRow> {
  @override
  String get tableName => 'user_comments';

  @override
  UserCommentsRow createRow(Map<String, dynamic> data) => UserCommentsRow(data);
}

class UserCommentsRow extends SupabaseDataRow {
  UserCommentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserCommentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get bookId => getField<int>('book_id');
  set bookId(int? value) => setField<int>('book_id', value);

  String? get comment => getField<String>('comment');
  set comment(String? value) => setField<String>('comment', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get firebaseUserId => getField<String>('firebase_user_id');
  set firebaseUserId(String? value) =>
      setField<String>('firebase_user_id', value);

  bool? get verified => getField<bool>('verified');
  set verified(bool? value) => setField<bool>('verified', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  List<String> get keyword => getListField<String>('keyword');
  set keyword(List<String>? value) => setListField<String>('keyword', value);
}
