import '../database.dart';

class HomeAdsTable extends SupabaseTable<HomeAdsRow> {
  @override
  String get tableName => 'home_ads';

  @override
  HomeAdsRow createRow(Map<String, dynamic> data) => HomeAdsRow(data);
}

class HomeAdsRow extends SupabaseDataRow {
  HomeAdsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HomeAdsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get coverImage => getField<String>('cover_image');
  set coverImage(String? value) => setField<String>('cover_image', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get subTitle => getField<String>('sub_title');
  set subTitle(String? value) => setField<String>('sub_title', value);

  int? get bookId => getField<int>('book_id');
  set bookId(int? value) => setField<int>('book_id', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  int? get linkID => getField<int>('link_ID');
  set linkID(int? value) => setField<int>('link_ID', value);

  String? get codeString => getField<String>('code_string');
  set codeString(String? value) => setField<String>('code_string', value);
}
