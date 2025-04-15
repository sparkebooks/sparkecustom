import '../database.dart';

class ClicksTable extends SupabaseTable<ClicksRow> {
  @override
  String get tableName => 'clicks';

  @override
  ClicksRow createRow(Map<String, dynamic> data) => ClicksRow(data);
}

class ClicksRow extends SupabaseDataRow {
  ClicksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClicksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get bookId => getField<int>('book_id');
  set bookId(int? value) => setField<int>('book_id', value);
}
