// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GetMetaDataStruct extends FFFirebaseStruct {
  GetMetaDataStruct({
    int? totalPages,
    List<int>? firstChapterPage,
    int? index,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _totalPages = totalPages,
        _firstChapterPage = firstChapterPage,
        _index = index,
        super(firestoreUtilData);

  // "total_pages" field.
  int? _totalPages;
  int get totalPages => _totalPages ?? 0;
  set totalPages(int? val) => _totalPages = val;

  void incrementTotalPages(int amount) => totalPages = totalPages + amount;

  bool hasTotalPages() => _totalPages != null;

  // "first_chapter_page" field.
  List<int>? _firstChapterPage;
  List<int> get firstChapterPage => _firstChapterPage ?? const [];
  set firstChapterPage(List<int>? val) => _firstChapterPage = val;

  void updateFirstChapterPage(Function(List<int>) updateFn) {
    updateFn(_firstChapterPage ??= []);
  }

  bool hasFirstChapterPage() => _firstChapterPage != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;

  void incrementIndex(int amount) => index = index + amount;

  bool hasIndex() => _index != null;

  static GetMetaDataStruct fromMap(Map<String, dynamic> data) =>
      GetMetaDataStruct(
        totalPages: castToType<int>(data['total_pages']),
        firstChapterPage: getDataList(data['first_chapter_page']),
        index: castToType<int>(data['index']),
      );

  static GetMetaDataStruct? maybeFromMap(dynamic data) => data is Map
      ? GetMetaDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'total_pages': _totalPages,
        'first_chapter_page': _firstChapterPage,
        'index': _index,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'total_pages': serializeParam(
          _totalPages,
          ParamType.int,
        ),
        'first_chapter_page': serializeParam(
          _firstChapterPage,
          ParamType.int,
          isList: true,
        ),
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
      }.withoutNulls;

  static GetMetaDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      GetMetaDataStruct(
        totalPages: deserializeParam(
          data['total_pages'],
          ParamType.int,
          false,
        ),
        firstChapterPage: deserializeParam<int>(
          data['first_chapter_page'],
          ParamType.int,
          true,
        ),
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'GetMetaDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GetMetaDataStruct &&
        totalPages == other.totalPages &&
        listEquality.equals(firstChapterPage, other.firstChapterPage) &&
        index == other.index;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([totalPages, firstChapterPage, index]);
}

GetMetaDataStruct createGetMetaDataStruct({
  int? totalPages,
  int? index,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GetMetaDataStruct(
      totalPages: totalPages,
      index: index,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GetMetaDataStruct? updateGetMetaDataStruct(
  GetMetaDataStruct? getMetaData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    getMetaData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGetMetaDataStructData(
  Map<String, dynamic> firestoreData,
  GetMetaDataStruct? getMetaData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (getMetaData == null) {
    return;
  }
  if (getMetaData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && getMetaData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final getMetaDataData =
      getGetMetaDataFirestoreData(getMetaData, forFieldValue);
  final nestedData =
      getMetaDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = getMetaData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGetMetaDataFirestoreData(
  GetMetaDataStruct? getMetaData, [
  bool forFieldValue = false,
]) {
  if (getMetaData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(getMetaData.toMap());

  // Add any Firestore field values
  getMetaData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGetMetaDataListFirestoreData(
  List<GetMetaDataStruct>? getMetaDatas,
) =>
    getMetaDatas?.map((e) => getGetMetaDataFirestoreData(e, true)).toList() ??
    [];
