import '../database.dart';

class BooksTable extends SupabaseTable<BooksRow> {
  @override
  String get tableName => 'books';

  @override
  BooksRow createRow(Map<String, dynamic> data) => BooksRow(data);
}

class BooksRow extends SupabaseDataRow {
  BooksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BooksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get author => getField<String>('author');
  set author(String? value) => setField<String>('author', value);

  String? get coverImage => getField<String>('cover_image');
  set coverImage(String? value) => setField<String>('cover_image', value);

  String? get blurb => getField<String>('blurb');
  set blurb(String? value) => setField<String>('blurb', value);

  String? get primaryTrope => getField<String>('primary_trope');
  set primaryTrope(String? value) => setField<String>('primary_trope', value);

  List<String> get secondaryTrope => getListField<String>('secondary_trope');
  set secondaryTrope(List<String>? value) =>
      setListField<String>('secondary_trope', value);

  int? get promoImpressions => getField<int>('promo_impressions');
  set promoImpressions(int? value) => setField<int>('promo_impressions', value);

  double? get totalRevenue => getField<double>('total_revenue');
  set totalRevenue(double? value) => setField<double>('total_revenue', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  bool? get justOut => getField<bool>('just_out');
  set justOut(bool? value) => setField<bool>('just_out', value);

  String? get status => getField<String>('Status');
  set status(String? value) => setField<String>('Status', value);

  DateTime? get lastUpdatedAt => getField<DateTime>('last_updated_at');
  set lastUpdatedAt(DateTime? value) =>
      setField<DateTime>('last_updated_at', value);

  DateTime? get publishedDate => getField<DateTime>('published_date');
  set publishedDate(DateTime? value) =>
      setField<DateTime>('published_date', value);

  bool? get valid => getField<bool>('valid');
  set valid(bool? value) => setField<bool>('valid', value);

  int? get bookScore => getField<int>('book_score');
  set bookScore(int? value) => setField<int>('book_score', value);

  int? get totalPages => getField<int>('total_pages');
  set totalPages(int? value) => setField<int>('total_pages', value);

  List<int> get firstChapterPages => getListField<int>('first_chapter_pages');
  set firstChapterPages(List<int>? value) =>
      setListField<int>('first_chapter_pages', value);

  int? get numOfChapters => getField<int>('num_of_chapters');
  set numOfChapters(int? value) => setField<int>('num_of_chapters', value);

  int? get totalWords => getField<int>('total_words');
  set totalWords(int? value) => setField<int>('total_words', value);

  int? get chapterCount => getField<int>('chapter_count');
  set chapterCount(int? value) => setField<int>('chapter_count', value);

  String? get authorFirebaseId => getField<String>('author_firebase_id');
  set authorFirebaseId(String? value) =>
      setField<String>('author_firebase_id', value);

  double? get rating => getField<double>('rating');
  set rating(double? value) => setField<double>('rating', value);

  int get impressions => getField<int>('impressions')!;
  set impressions(int value) => setField<int>('impressions', value);

  int? get dailyPassCounter => getField<int>('daily_pass_counter');
  set dailyPassCounter(int? value) =>
      setField<int>('daily_pass_counter', value);

  String? get createdByFirebaseID => getField<String>('created_by_firebase_ID');
  set createdByFirebaseID(String? value) =>
      setField<String>('created_by_firebase_ID', value);

  String? get fileUrl => getField<String>('file_url');
  set fileUrl(String? value) => setField<String>('file_url', value);

  String? get createdByType => getField<String>('created_by_type');
  set createdByType(String? value) =>
      setField<String>('created_by_type', value);

  bool? get abTestActive => getField<bool>('ab_test_active');
  set abTestActive(bool? value) => setField<bool>('ab_test_active', value);

  int? get paidChapter => getField<int>('paid_chapter');
  set paidChapter(int? value) => setField<int>('paid_chapter', value);

  int get initiations => getField<int>('initiations')!;
  set initiations(int value) => setField<int>('initiations', value);

  int? get costPerChapter => getField<int>('cost_per_chapter');
  set costPerChapter(int? value) => setField<int>('cost_per_chapter', value);

  int? get bulkChapterNumber => getField<int>('bulk_chapter_number');
  set bulkChapterNumber(int? value) =>
      setField<int>('bulk_chapter_number', value);

  String? get seriesName => getField<String>('series_name');
  set seriesName(String? value) => setField<String>('series_name', value);

  int? get seriesOrder => getField<int>('series_order');
  set seriesOrder(int? value) => setField<int>('series_order', value);

  double? get discountPerChapter => getField<double>('discount_per_chapter');
  set discountPerChapter(double? value) =>
      setField<double>('discount_per_chapter', value);
}
