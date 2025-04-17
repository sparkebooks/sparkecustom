import '../database.dart';

class ChapterUnlocksTable extends SupabaseTable<ChapterUnlocksRow> {
  @override
  String get tableName => 'chapter_unlocks';

  @override
  ChapterUnlocksRow createRow(Map<String, dynamic> data) =>
      ChapterUnlocksRow(data);
}

class ChapterUnlocksRow extends SupabaseDataRow {
  ChapterUnlocksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChapterUnlocksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get firebaseUid => getField<String>('firebase_uid')!;
  set firebaseUid(String value) => setField<String>('firebase_uid', value);

  int? get chapterId => getField<int>('chapter_id');
  set chapterId(int? value) => setField<int>('chapter_id', value);

  int get coinsSpent => getField<int>('coins_spent')!;
  set coinsSpent(int value) => setField<int>('coins_spent', value);

  int get paidCoinsUsed => getField<int>('paid_coins_used')!;
  set paidCoinsUsed(int value) => setField<int>('paid_coins_used', value);

  int get nonPaidCoinsUsed => getField<int>('non_paid_coins_used')!;
  set nonPaidCoinsUsed(int value) =>
      setField<int>('non_paid_coins_used', value);

  int? get bookId => getField<int>('book_id');
  set bookId(int? value) => setField<int>('book_id', value);

  int? get userBookId => getField<int>('user_book_id');
  set userBookId(int? value) => setField<int>('user_book_id', value);
}
