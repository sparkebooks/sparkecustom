import '../database.dart';

class ChaptersTable extends SupabaseTable<ChaptersRow> {
  @override
  String get tableName => 'chapters';

  @override
  ChaptersRow createRow(Map<String, dynamic> data) => ChaptersRow(data);
}

class ChaptersRow extends SupabaseDataRow {
  ChaptersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChaptersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get bookId => getField<int>('book_id');
  set bookId(int? value) => setField<int>('book_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  int? get contentLength => getField<int>('content_length');
  set contentLength(int? value) => setField<int>('content_length', value);

  int? get chapterOrder => getField<int>('chapter_order');
  set chapterOrder(int? value) => setField<int>('chapter_order', value);

  String? get chapter => getField<String>('chapter');
  set chapter(String? value) => setField<String>('chapter', value);

  bool? get paymentRequired => getField<bool>('payment_required');
  set paymentRequired(bool? value) => setField<bool>('payment_required', value);

  int? get numOfPages => getField<int>('num_of_pages');
  set numOfPages(int? value) => setField<int>('num_of_pages', value);
}
