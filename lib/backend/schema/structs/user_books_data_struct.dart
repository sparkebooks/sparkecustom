// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserBooksDataStruct extends FFFirebaseStruct {
  UserBooksDataStruct({
    int? userbookId,
    int? userbookPageNumber,
    int? indexInLocal,
    int? bookTotalPages,
    bool? readingMode,
    int? chaptersUnlocked,
    String? bookName,
    String? bookImage,
    int? bookId,
    DateTime? updatedAt,
    bool? nextChapterFirst,
    double? bookProgress,
    int? currentChapter,
    bool? isPaymentRequired,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userbookId = userbookId,
        _userbookPageNumber = userbookPageNumber,
        _indexInLocal = indexInLocal,
        _bookTotalPages = bookTotalPages,
        _readingMode = readingMode,
        _chaptersUnlocked = chaptersUnlocked,
        _bookName = bookName,
        _bookImage = bookImage,
        _bookId = bookId,
        _updatedAt = updatedAt,
        _nextChapterFirst = nextChapterFirst,
        _bookProgress = bookProgress,
        _currentChapter = currentChapter,
        _isPaymentRequired = isPaymentRequired,
        super(firestoreUtilData);

  // "userbook_id" field.
  int? _userbookId;
  int get userbookId => _userbookId ?? 0;
  set userbookId(int? val) => _userbookId = val;

  void incrementUserbookId(int amount) => userbookId = userbookId + amount;

  bool hasUserbookId() => _userbookId != null;

  // "userbook_page_number" field.
  int? _userbookPageNumber;
  int get userbookPageNumber => _userbookPageNumber ?? 0;
  set userbookPageNumber(int? val) => _userbookPageNumber = val;

  void incrementUserbookPageNumber(int amount) =>
      userbookPageNumber = userbookPageNumber + amount;

  bool hasUserbookPageNumber() => _userbookPageNumber != null;

  // "index_in_local" field.
  int? _indexInLocal;
  int get indexInLocal => _indexInLocal ?? 0;
  set indexInLocal(int? val) => _indexInLocal = val;

  void incrementIndexInLocal(int amount) =>
      indexInLocal = indexInLocal + amount;

  bool hasIndexInLocal() => _indexInLocal != null;

  // "book_total_pages" field.
  int? _bookTotalPages;
  int get bookTotalPages => _bookTotalPages ?? 0;
  set bookTotalPages(int? val) => _bookTotalPages = val;

  void incrementBookTotalPages(int amount) =>
      bookTotalPages = bookTotalPages + amount;

  bool hasBookTotalPages() => _bookTotalPages != null;

  // "reading_mode" field.
  bool? _readingMode;
  bool get readingMode => _readingMode ?? false;
  set readingMode(bool? val) => _readingMode = val;

  bool hasReadingMode() => _readingMode != null;

  // "chapters_unlocked" field.
  int? _chaptersUnlocked;
  int get chaptersUnlocked => _chaptersUnlocked ?? 0;
  set chaptersUnlocked(int? val) => _chaptersUnlocked = val;

  void incrementChaptersUnlocked(int amount) =>
      chaptersUnlocked = chaptersUnlocked + amount;

  bool hasChaptersUnlocked() => _chaptersUnlocked != null;

  // "book_name" field.
  String? _bookName;
  String get bookName => _bookName ?? '';
  set bookName(String? val) => _bookName = val;

  bool hasBookName() => _bookName != null;

  // "book_image" field.
  String? _bookImage;
  String get bookImage => _bookImage ?? '';
  set bookImage(String? val) => _bookImage = val;

  bool hasBookImage() => _bookImage != null;

  // "book_id" field.
  int? _bookId;
  int get bookId => _bookId ?? 0;
  set bookId(int? val) => _bookId = val;

  void incrementBookId(int amount) => bookId = bookId + amount;

  bool hasBookId() => _bookId != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "nextChapter_first" field.
  bool? _nextChapterFirst;
  bool get nextChapterFirst => _nextChapterFirst ?? false;
  set nextChapterFirst(bool? val) => _nextChapterFirst = val;

  bool hasNextChapterFirst() => _nextChapterFirst != null;

  // "bookProgress" field.
  double? _bookProgress;
  double get bookProgress => _bookProgress ?? 0.0;
  set bookProgress(double? val) => _bookProgress = val;

  void incrementBookProgress(double amount) =>
      bookProgress = bookProgress + amount;

  bool hasBookProgress() => _bookProgress != null;

  // "currentChapter" field.
  int? _currentChapter;
  int get currentChapter => _currentChapter ?? 0;
  set currentChapter(int? val) => _currentChapter = val;

  void incrementCurrentChapter(int amount) =>
      currentChapter = currentChapter + amount;

  bool hasCurrentChapter() => _currentChapter != null;

  // "isPaymentRequired" field.
  bool? _isPaymentRequired;
  bool get isPaymentRequired => _isPaymentRequired ?? false;
  set isPaymentRequired(bool? val) => _isPaymentRequired = val;

  bool hasIsPaymentRequired() => _isPaymentRequired != null;

  static UserBooksDataStruct fromMap(Map<String, dynamic> data) =>
      UserBooksDataStruct(
        userbookId: castToType<int>(data['userbook_id']),
        userbookPageNumber: castToType<int>(data['userbook_page_number']),
        indexInLocal: castToType<int>(data['index_in_local']),
        bookTotalPages: castToType<int>(data['book_total_pages']),
        readingMode: data['reading_mode'] as bool?,
        chaptersUnlocked: castToType<int>(data['chapters_unlocked']),
        bookName: data['book_name'] as String?,
        bookImage: data['book_image'] as String?,
        bookId: castToType<int>(data['book_id']),
        updatedAt: data['updated_at'] as DateTime?,
        nextChapterFirst: data['nextChapter_first'] as bool?,
        bookProgress: castToType<double>(data['bookProgress']),
        currentChapter: castToType<int>(data['currentChapter']),
        isPaymentRequired: data['isPaymentRequired'] as bool?,
      );

  static UserBooksDataStruct? maybeFromMap(dynamic data) => data is Map
      ? UserBooksDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userbook_id': _userbookId,
        'userbook_page_number': _userbookPageNumber,
        'index_in_local': _indexInLocal,
        'book_total_pages': _bookTotalPages,
        'reading_mode': _readingMode,
        'chapters_unlocked': _chaptersUnlocked,
        'book_name': _bookName,
        'book_image': _bookImage,
        'book_id': _bookId,
        'updated_at': _updatedAt,
        'nextChapter_first': _nextChapterFirst,
        'bookProgress': _bookProgress,
        'currentChapter': _currentChapter,
        'isPaymentRequired': _isPaymentRequired,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userbook_id': serializeParam(
          _userbookId,
          ParamType.int,
        ),
        'userbook_page_number': serializeParam(
          _userbookPageNumber,
          ParamType.int,
        ),
        'index_in_local': serializeParam(
          _indexInLocal,
          ParamType.int,
        ),
        'book_total_pages': serializeParam(
          _bookTotalPages,
          ParamType.int,
        ),
        'reading_mode': serializeParam(
          _readingMode,
          ParamType.bool,
        ),
        'chapters_unlocked': serializeParam(
          _chaptersUnlocked,
          ParamType.int,
        ),
        'book_name': serializeParam(
          _bookName,
          ParamType.String,
        ),
        'book_image': serializeParam(
          _bookImage,
          ParamType.String,
        ),
        'book_id': serializeParam(
          _bookId,
          ParamType.int,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'nextChapter_first': serializeParam(
          _nextChapterFirst,
          ParamType.bool,
        ),
        'bookProgress': serializeParam(
          _bookProgress,
          ParamType.double,
        ),
        'currentChapter': serializeParam(
          _currentChapter,
          ParamType.int,
        ),
        'isPaymentRequired': serializeParam(
          _isPaymentRequired,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserBooksDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserBooksDataStruct(
        userbookId: deserializeParam(
          data['userbook_id'],
          ParamType.int,
          false,
        ),
        userbookPageNumber: deserializeParam(
          data['userbook_page_number'],
          ParamType.int,
          false,
        ),
        indexInLocal: deserializeParam(
          data['index_in_local'],
          ParamType.int,
          false,
        ),
        bookTotalPages: deserializeParam(
          data['book_total_pages'],
          ParamType.int,
          false,
        ),
        readingMode: deserializeParam(
          data['reading_mode'],
          ParamType.bool,
          false,
        ),
        chaptersUnlocked: deserializeParam(
          data['chapters_unlocked'],
          ParamType.int,
          false,
        ),
        bookName: deserializeParam(
          data['book_name'],
          ParamType.String,
          false,
        ),
        bookImage: deserializeParam(
          data['book_image'],
          ParamType.String,
          false,
        ),
        bookId: deserializeParam(
          data['book_id'],
          ParamType.int,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        nextChapterFirst: deserializeParam(
          data['nextChapter_first'],
          ParamType.bool,
          false,
        ),
        bookProgress: deserializeParam(
          data['bookProgress'],
          ParamType.double,
          false,
        ),
        currentChapter: deserializeParam(
          data['currentChapter'],
          ParamType.int,
          false,
        ),
        isPaymentRequired: deserializeParam(
          data['isPaymentRequired'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserBooksDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserBooksDataStruct &&
        userbookId == other.userbookId &&
        userbookPageNumber == other.userbookPageNumber &&
        indexInLocal == other.indexInLocal &&
        bookTotalPages == other.bookTotalPages &&
        readingMode == other.readingMode &&
        chaptersUnlocked == other.chaptersUnlocked &&
        bookName == other.bookName &&
        bookImage == other.bookImage &&
        bookId == other.bookId &&
        updatedAt == other.updatedAt &&
        nextChapterFirst == other.nextChapterFirst &&
        bookProgress == other.bookProgress &&
        currentChapter == other.currentChapter &&
        isPaymentRequired == other.isPaymentRequired;
  }

  UserBooksDataStruct copyWith({
    int? userbookId,
    int? userbookPageNumber,
    int? indexInLocal,
    int? bookTotalPages,
    bool? readingMode,
    int? chaptersUnlocked,
    String? bookName,
    String? bookImage,
    int? bookId,
    DateTime? updatedAt,
    bool? nextChapterFirst,
    double? bookProgress,
    int? currentChapter,
    bool? isPaymentRequired,
    FirestoreUtilData? firestoreUtilData,
  }) {
    return UserBooksDataStruct(
      userbookId: userbookId ?? _userbookId,
      userbookPageNumber: userbookPageNumber ?? _userbookPageNumber,
      indexInLocal: indexInLocal ?? _indexInLocal,
      bookTotalPages: bookTotalPages ?? _bookTotalPages,
      readingMode: readingMode ?? _readingMode,
      chaptersUnlocked: chaptersUnlocked ?? _chaptersUnlocked,
      bookName: bookName ?? _bookName,
      bookImage: bookImage ?? _bookImage,
      bookId: bookId ?? _bookId,
      updatedAt: updatedAt ?? _updatedAt,
      nextChapterFirst: nextChapterFirst ?? _nextChapterFirst,
      bookProgress: bookProgress ?? _bookProgress,
      currentChapter: currentChapter ?? _currentChapter,
      isPaymentRequired: isPaymentRequired ?? _isPaymentRequired,
      firestoreUtilData: firestoreUtilData ?? this.firestoreUtilData,
    );
  }

  @override
  int get hashCode => const ListEquality().hash([
        userbookId,
        userbookPageNumber,
        indexInLocal,
        bookTotalPages,
        readingMode,
        chaptersUnlocked,
        bookName,
        bookImage,
        bookId,
        updatedAt,
        nextChapterFirst,
        bookProgress,
        currentChapter,
        isPaymentRequired
      ]);
}

UserBooksDataStruct createUserBooksDataStruct({
  int? userbookId,
  int? userbookPageNumber,
  int? indexInLocal,
  int? bookTotalPages,
  bool? readingMode,
  int? chaptersUnlocked,
  String? bookName,
  String? bookImage,
  int? bookId,
  DateTime? updatedAt,
  bool? nextChapterFirst,
  double? bookProgress,
  int? currentChapter,
  bool? isPaymentRequired,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserBooksDataStruct(
      userbookId: userbookId,
      userbookPageNumber: userbookPageNumber,
      indexInLocal: indexInLocal,
      bookTotalPages: bookTotalPages,
      readingMode: readingMode,
      chaptersUnlocked: chaptersUnlocked,
      bookName: bookName,
      bookImage: bookImage,
      bookId: bookId,
      updatedAt: updatedAt,
      nextChapterFirst: nextChapterFirst,
      bookProgress: bookProgress,
      currentChapter: currentChapter,
      isPaymentRequired: isPaymentRequired,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserBooksDataStruct? updateUserBooksDataStruct(
  UserBooksDataStruct? userBooksData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userBooksData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserBooksDataStructData(
  Map<String, dynamic> firestoreData,
  UserBooksDataStruct? userBooksData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userBooksData == null) {
    return;
  }
  if (userBooksData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userBooksData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userBooksDataData =
      getUserBooksDataFirestoreData(userBooksData, forFieldValue);
  final nestedData =
      userBooksDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userBooksData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserBooksDataFirestoreData(
  UserBooksDataStruct? userBooksData, [
  bool forFieldValue = false,
]) {
  if (userBooksData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userBooksData.toMap());

  // Add any Firestore field values
  userBooksData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserBooksDataListFirestoreData(
  List<UserBooksDataStruct>? userBooksDatas,
) =>
    userBooksDatas
        ?.map((e) => getUserBooksDataFirestoreData(e, true))
        .toList() ??
    [];
