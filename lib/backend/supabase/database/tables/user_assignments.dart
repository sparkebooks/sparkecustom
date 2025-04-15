import '../database.dart';

class UserAssignmentsTable extends SupabaseTable<UserAssignmentsRow> {
  @override
  String get tableName => 'user_assignments';

  @override
  UserAssignmentsRow createRow(Map<String, dynamic> data) =>
      UserAssignmentsRow(data);
}

class UserAssignmentsRow extends SupabaseDataRow {
  UserAssignmentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserAssignmentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get abTestId => getField<int>('ab_test_id')!;
  set abTestId(int value) => setField<int>('ab_test_id', value);

  int? get variantId => getField<int>('variant_id');
  set variantId(int? value) => setField<int>('variant_id', value);
}
