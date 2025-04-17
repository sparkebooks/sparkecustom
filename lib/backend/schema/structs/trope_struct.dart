// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TropeStruct extends FFFirebaseStruct {
  TropeStruct({
    String? name,
    String? image,
    int? totalBooks,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _image = image,
        _totalBooks = totalBooks,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "total_books" field.
  int? _totalBooks;
  int get totalBooks => _totalBooks ?? 0;
  set totalBooks(int? val) => _totalBooks = val;

  void incrementTotalBooks(int amount) => totalBooks = totalBooks + amount;

  bool hasTotalBooks() => _totalBooks != null;

  static TropeStruct fromMap(Map<String, dynamic> data) => TropeStruct(
        name: data['name'] as String?,
        image: data['image'] as String?,
        totalBooks: castToType<int>(data['total_books']),
      );

  static TropeStruct? maybeFromMap(dynamic data) =>
      data is Map ? TropeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'image': _image,
        'total_books': _totalBooks,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'total_books': serializeParam(
          _totalBooks,
          ParamType.int,
        ),
      }.withoutNulls;

  static TropeStruct fromSerializableMap(Map<String, dynamic> data) =>
      TropeStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        totalBooks: deserializeParam(
          data['total_books'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TropeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TropeStruct &&
        name == other.name &&
        image == other.image &&
        totalBooks == other.totalBooks;
  }

  @override
  int get hashCode => const ListEquality().hash([name, image, totalBooks]);
}

TropeStruct createTropeStruct({
  String? name,
  String? image,
  int? totalBooks,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TropeStruct(
      name: name,
      image: image,
      totalBooks: totalBooks,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TropeStruct? updateTropeStruct(
  TropeStruct? trope, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    trope
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTropeStructData(
  Map<String, dynamic> firestoreData,
  TropeStruct? trope,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (trope == null) {
    return;
  }
  if (trope.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && trope.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tropeData = getTropeFirestoreData(trope, forFieldValue);
  final nestedData = tropeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = trope.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTropeFirestoreData(
  TropeStruct? trope, [
  bool forFieldValue = false,
]) {
  if (trope == null) {
    return {};
  }
  final firestoreData = mapToFirestore(trope.toMap());

  // Add any Firestore field values
  trope.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTropeListFirestoreData(
  List<TropeStruct>? tropes,
) =>
    tropes?.map((e) => getTropeFirestoreData(e, true)).toList() ?? [];
