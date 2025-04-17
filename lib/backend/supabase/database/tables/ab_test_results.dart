import '../database.dart';

class AbTestResultsTable extends SupabaseTable<AbTestResultsRow> {
  @override
  String get tableName => 'ab_test_results';

  @override
  AbTestResultsRow createRow(Map<String, dynamic> data) =>
      AbTestResultsRow(data);
}

class AbTestResultsRow extends SupabaseDataRow {
  AbTestResultsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AbTestResultsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get abTestId => getField<int>('ab_test_id')!;
  set abTestId(int value) => setField<int>('ab_test_id', value);

  String? get variant => getField<String>('variant');
  set variant(String? value) => setField<String>('variant', value);

  bool? get winner => getField<bool>('winner');
  set winner(bool? value) => setField<bool>('winner', value);

  int? get value => getField<int>('value');
  set value(int? value) => setField<int>('value', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get blurb => getField<String>('blurb');
  set blurb(String? value) => setField<String>('blurb', value);

  String? get coverImage => getField<String>('cover_image');
  set coverImage(String? value) => setField<String>('cover_image', value);

  double? get revenue => getField<double>('revenue');
  set revenue(double? value) => setField<double>('revenue', value);

  int? get impressions => getField<int>('impressions');
  set impressions(int? value) => setField<int>('impressions', value);

  int? get initiations => getField<int>('initiations');
  set initiations(int? value) => setField<int>('initiations', value);

  int? get bookScore => getField<int>('book_score');
  set bookScore(int? value) => setField<int>('book_score', value);

  String? get testType => getField<String>('test_type');
  set testType(String? value) => setField<String>('test_type', value);

  double get distribution => getField<double>('distribution')!;
  set distribution(double value) => setField<double>('distribution', value);
}
