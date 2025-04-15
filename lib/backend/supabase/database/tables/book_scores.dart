import '../database.dart';

class BookScoresTable extends SupabaseTable<BookScoresRow> {
  @override
  String get tableName => 'book_scores';

  @override
  BookScoresRow createRow(Map<String, dynamic> data) => BookScoresRow(data);
}

class BookScoresRow extends SupabaseDataRow {
  BookScoresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BookScoresTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get bookId => getField<int>('book_id');
  set bookId(int? value) => setField<int>('book_id', value);

  double? get score => getField<double>('score');
  set score(double? value) => setField<double>('score', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
