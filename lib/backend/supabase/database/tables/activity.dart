import '../database.dart';

class ActivityTable extends SupabaseTable<ActivityRow> {
  @override
  String get tableName => 'activity';

  @override
  ActivityRow createRow(Map<String, dynamic> data) => ActivityRow(data);
}

class ActivityRow extends SupabaseDataRow {
  ActivityRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ActivityTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  List<String> get userList => getListField<String>('user_list');
  set userList(List<String>? value) => setListField<String>('user_list', value);

  int? get bookId => getField<int>('book_id');
  set bookId(int? value) => setField<int>('book_id', value);

  String? get creatorFirebaseID => getField<String>('creator_firebase_ID');
  set creatorFirebaseID(String? value) =>
      setField<String>('creator_firebase_ID', value);

  String? get activityType => getField<String>('activity_type');
  set activityType(String? value) => setField<String>('activity_type', value);
}
