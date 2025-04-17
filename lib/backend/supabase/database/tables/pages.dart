import '../database.dart';

class PagesTable extends SupabaseTable<PagesRow> {
  @override
  String get tableName => 'pages';

  @override
  PagesRow createRow(Map<String, dynamic> data) => PagesRow(data);
}

class PagesRow extends SupabaseDataRow {
  PagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get bookId => getField<int>('book_id');
  set bookId(int? value) => setField<int>('book_id', value);

  int? get chapterId => getField<int>('chapter_id');
  set chapterId(int? value) => setField<int>('chapter_id', value);

  int? get pageNumber => getField<int>('page_number');
  set pageNumber(int? value) => setField<int>('page_number', value);

  String? get pageContent => getField<String>('page_content');
  set pageContent(String? value) => setField<String>('page_content', value);

  bool? get paymentRequired => getField<bool>('payment_required');
  set paymentRequired(bool? value) => setField<bool>('payment_required', value);

  bool? get chapterStart => getField<bool>('chapter_start');
  set chapterStart(bool? value) => setField<bool>('chapter_start', value);
}
