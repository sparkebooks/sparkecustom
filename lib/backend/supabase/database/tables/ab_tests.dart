import '../database.dart';

class AbTestsTable extends SupabaseTable<AbTestsRow> {
  @override
  String get tableName => 'ab_tests';

  @override
  AbTestsRow createRow(Map<String, dynamic> data) => AbTestsRow(data);
}

class AbTestsRow extends SupabaseDataRow {
  AbTestsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AbTestsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get bookId => getField<int>('book_id');
  set bookId(int? value) => setField<int>('book_id', value);

  String? get status => getField<String>('Status');
  set status(String? value) => setField<String>('Status', value);

  DateTime get startDate => getField<DateTime>('start_date')!;
  set startDate(DateTime value) => setField<DateTime>('start_date', value);

  int? get winningVariantId => getField<int>('winning_variant_id');
  set winningVariantId(int? value) =>
      setField<int>('winning_variant_id', value);
}
