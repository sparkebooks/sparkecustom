import '../database.dart';

class ClickThroughsTable extends SupabaseTable<ClickThroughsRow> {
  @override
  String get tableName => 'click_throughs';

  @override
  ClickThroughsRow createRow(Map<String, dynamic> data) =>
      ClickThroughsRow(data);
}

class ClickThroughsRow extends SupabaseDataRow {
  ClickThroughsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClickThroughsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get source => getField<String>('source');
  set source(String? value) => setField<String>('source', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get bookId => getField<int>('book_id');
  set bookId(int? value) => setField<int>('book_id', value);
}
