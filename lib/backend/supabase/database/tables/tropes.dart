import '../database.dart';

class TropesTable extends SupabaseTable<TropesRow> {
  @override
  String get tableName => 'tropes';

  @override
  TropesRow createRow(Map<String, dynamic> data) => TropesRow(data);
}

class TropesRow extends SupabaseDataRow {
  TropesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TropesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get coverImage => getField<String>('cover_image');
  set coverImage(String? value) => setField<String>('cover_image', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);
}
