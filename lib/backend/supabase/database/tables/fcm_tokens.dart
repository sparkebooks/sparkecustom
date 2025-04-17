import '../database.dart';

class FcmTokensTable extends SupabaseTable<FcmTokensRow> {
  @override
  String get tableName => 'fcm_tokens';

  @override
  FcmTokensRow createRow(Map<String, dynamic> data) => FcmTokensRow(data);
}

class FcmTokensRow extends SupabaseDataRow {
  FcmTokensRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FcmTokensTable();

  String get firebaseUid => getField<String>('firebase_uid')!;
  set firebaseUid(String value) => setField<String>('firebase_uid', value);

  String get token => getField<String>('token')!;
  set token(String value) => setField<String>('token', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
