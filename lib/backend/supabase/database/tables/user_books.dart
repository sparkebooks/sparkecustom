import '../database.dart';

class UserBooksTable extends SupabaseTable<UserBooksRow> {
  @override
  String get tableName => 'user_books';

  @override
  UserBooksRow createRow(Map<String, dynamic> data) => UserBooksRow(data);
}

class UserBooksRow extends SupabaseDataRow {
  UserBooksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserBooksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get bookId => getField<int>('book_id');
  set bookId(int? value) => setField<int>('book_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get firebaseUserId => getField<String>('firebase_user_id');
  set firebaseUserId(String? value) =>
      setField<String>('firebase_user_id', value);

  int? get pageNumber => getField<int>('page_number');
  set pageNumber(int? value) => setField<int>('page_number', value);

  bool? get opened => getField<bool>('opened');
  set opened(bool? value) => setField<bool>('opened', value);

  int? get totalPages => getField<int>('total_pages');
  set totalPages(int? value) => setField<int>('total_pages', value);

  int? get pageLeftOff => getField<int>('page_left_off');
  set pageLeftOff(int? value) => setField<int>('page_left_off', value);

  int? get chapterId => getField<int>('chapter_id');
  set chapterId(int? value) => setField<int>('chapter_id', value);

  int? get chapterIndex => getField<int>('chapter_index');
  set chapterIndex(int? value) => setField<int>('chapter_index', value);

  int? get pagesInChapter => getField<int>('pages_in_chapter');
  set pagesInChapter(int? value) => setField<int>('pages_in_chapter', value);

  int? get chapterIdIndex => getField<int>('chapter_id_index');
  set chapterIdIndex(int? value) => setField<int>('chapter_id_index', value);

  int get chaptersUnlocked => getField<int>('chapters_unlocked')!;
  set chaptersUnlocked(int value) => setField<int>('chapters_unlocked', value);

  double? get rating => getField<double>('rating');
  set rating(double? value) => setField<double>('rating', value);

  bool? get nextPageFirst => getField<bool>('nextPageFirst');
  set nextPageFirst(bool? value) => setField<bool>('nextPageFirst', value);

  DateTime? get dailyNotifSentAt => getField<DateTime>('daily_notif_sent_at');
  set dailyNotifSentAt(DateTime? value) =>
      setField<DateTime>('daily_notif_sent_at', value);

  double get bookProgress => getField<double>('book_progress')!;
  set bookProgress(double value) => setField<double>('book_progress', value);

  String? get lastVisitedWordIndex =>
      getField<String>('last_visited_word_index');
  set lastVisitedWordIndex(String? value) =>
      setField<String>('last_visited_word_index', value);
}
