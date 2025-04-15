// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PagesStruct extends FFFirebaseStruct {
  PagesStruct({
    int? id,
    String? createdAt,
    int? bookId,
    int? chapterId,
    int? pageNumber,
    String? pageContent,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _createdAt = createdAt,
        _bookId = bookId,
        _chapterId = chapterId,
        _pageNumber = pageNumber,
        _pageContent = pageContent,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "book_id" field.
  int? _bookId;
  int get bookId => _bookId ?? 0;
  set bookId(int? val) => _bookId = val;

  void incrementBookId(int amount) => bookId = bookId + amount;

  bool hasBookId() => _bookId != null;

  // "chapter_id" field.
  int? _chapterId;
  int get chapterId => _chapterId ?? 0;
  set chapterId(int? val) => _chapterId = val;

  void incrementChapterId(int amount) => chapterId = chapterId + amount;

  bool hasChapterId() => _chapterId != null;

  // "page_number" field.
  int? _pageNumber;
  int get pageNumber => _pageNumber ?? 0;
  set pageNumber(int? val) => _pageNumber = val;

  void incrementPageNumber(int amount) => pageNumber = pageNumber + amount;

  bool hasPageNumber() => _pageNumber != null;

  // "page_content" field.
  String? _pageContent;
  String get pageContent => _pageContent ?? '';
  set pageContent(String? val) => _pageContent = val;

  bool hasPageContent() => _pageContent != null;

  static PagesStruct fromMap(Map<String, dynamic> data) => PagesStruct(
        id: castToType<int>(data['id']),
        createdAt: data['created_at'] as String?,
        bookId: castToType<int>(data['book_id']),
        chapterId: castToType<int>(data['chapter_id']),
        pageNumber: castToType<int>(data['page_number']),
        pageContent: data['page_content'] as String?,
      );

  static PagesStruct? maybeFromMap(dynamic data) =>
      data is Map ? PagesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'book_id': _bookId,
        'chapter_id': _chapterId,
        'page_number': _pageNumber,
        'page_content': _pageContent,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'book_id': serializeParam(
          _bookId,
          ParamType.int,
        ),
        'chapter_id': serializeParam(
          _chapterId,
          ParamType.int,
        ),
        'page_number': serializeParam(
          _pageNumber,
          ParamType.int,
        ),
        'page_content': serializeParam(
          _pageContent,
          ParamType.String,
        ),
      }.withoutNulls;

  static PagesStruct fromSerializableMap(Map<String, dynamic> data) =>
      PagesStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        bookId: deserializeParam(
          data['book_id'],
          ParamType.int,
          false,
        ),
        chapterId: deserializeParam(
          data['chapter_id'],
          ParamType.int,
          false,
        ),
        pageNumber: deserializeParam(
          data['page_number'],
          ParamType.int,
          false,
        ),
        pageContent: deserializeParam(
          data['page_content'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PagesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PagesStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        bookId == other.bookId &&
        chapterId == other.chapterId &&
        pageNumber == other.pageNumber &&
        pageContent == other.pageContent;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, createdAt, bookId, chapterId, pageNumber, pageContent]);
}

PagesStruct createPagesStruct({
  int? id,
  String? createdAt,
  int? bookId,
  int? chapterId,
  int? pageNumber,
  String? pageContent,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PagesStruct(
      id: id,
      createdAt: createdAt,
      bookId: bookId,
      chapterId: chapterId,
      pageNumber: pageNumber,
      pageContent: pageContent,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PagesStruct? updatePagesStruct(
  PagesStruct? pages, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pages
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPagesStructData(
  Map<String, dynamic> firestoreData,
  PagesStruct? pages,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pages == null) {
    return;
  }
  if (pages.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pages.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pagesData = getPagesFirestoreData(pages, forFieldValue);
  final nestedData = pagesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pages.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPagesFirestoreData(
  PagesStruct? pages, [
  bool forFieldValue = false,
]) {
  if (pages == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pages.toMap());

  // Add any Firestore field values
  pages.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPagesListFirestoreData(
  List<PagesStruct>? pagess,
) =>
    pagess?.map((e) => getPagesFirestoreData(e, true)).toList() ?? [];
