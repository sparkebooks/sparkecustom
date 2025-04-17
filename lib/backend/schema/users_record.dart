import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "haveRead" field.
  bool? _haveRead;
  bool get haveRead => _haveRead ?? false;
  bool hasHaveRead() => _haveRead != null;

  // "selected_tropes" field.
  List<String>? _selectedTropes;
  List<String> get selectedTropes => _selectedTropes ?? const [];
  bool hasSelectedTropes() => _selectedTropes != null;

  // "age_range" field.
  String? _ageRange;
  String get ageRange => _ageRange ?? '';
  bool hasAgeRange() => _ageRange != null;

  // "total_books" field.
  int? _totalBooks;
  int get totalBooks => _totalBooks ?? 0;
  bool hasTotalBooks() => _totalBooks != null;

  // "anonymous_user" field.
  bool? _anonymousUser;
  bool get anonymousUser => _anonymousUser ?? false;
  bool hasAnonymousUser() => _anonymousUser != null;

  // "notifications_daily_reminders" field.
  bool? _notificationsDailyReminders;
  bool get notificationsDailyReminders => _notificationsDailyReminders ?? false;
  bool hasNotificationsDailyReminders() => _notificationsDailyReminders != null;

  // "notifications_new_book_alerts" field.
  bool? _notificationsNewBookAlerts;
  bool get notificationsNewBookAlerts => _notificationsNewBookAlerts ?? false;
  bool hasNotificationsNewBookAlerts() => _notificationsNewBookAlerts != null;

  // "notifications_user_location" field.
  bool? _notificationsUserLocation;
  bool get notificationsUserLocation => _notificationsUserLocation ?? false;
  bool hasNotificationsUserLocation() => _notificationsUserLocation != null;

  // "daily_pass_last_active" field.
  DateTime? _dailyPassLastActive;
  DateTime? get dailyPassLastActive => _dailyPassLastActive;
  bool hasDailyPassLastActive() => _dailyPassLastActive != null;

  // "author_status" field.
  UserStatus? _authorStatus;
  UserStatus? get authorStatus => _authorStatus;
  bool hasAuthorStatus() => _authorStatus != null;

  // "user_role" field.
  UserRole? _userRole;
  UserRole? get userRole => _userRole;
  bool hasUserRole() => _userRole != null;

  // "last_read_notification" field.
  DateTime? _lastReadNotification;
  DateTime? get lastReadNotification => _lastReadNotification;
  bool hasLastReadNotification() => _lastReadNotification != null;

  // "my_redeemed_codes" field.
  List<String>? _myRedeemedCodes;
  List<String> get myRedeemedCodes => _myRedeemedCodes ?? const [];
  bool hasMyRedeemedCodes() => _myRedeemedCodes != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _haveRead = snapshotData['haveRead'] as bool?;
    _selectedTropes = getDataList(snapshotData['selected_tropes']);
    _ageRange = snapshotData['age_range'] as String?;
    _totalBooks = castToType<int>(snapshotData['total_books']);
    _anonymousUser = snapshotData['anonymous_user'] as bool?;
    _notificationsDailyReminders =
        snapshotData['notifications_daily_reminders'] as bool?;
    _notificationsNewBookAlerts =
        snapshotData['notifications_new_book_alerts'] as bool?;
    _notificationsUserLocation =
        snapshotData['notifications_user_location'] as bool?;
    _dailyPassLastActive = snapshotData['daily_pass_last_active'] as DateTime?;
    _authorStatus = snapshotData['author_status'] is UserStatus
        ? snapshotData['author_status']
        : deserializeEnum<UserStatus>(snapshotData['author_status']);
    _userRole = snapshotData['user_role'] is UserRole
        ? snapshotData['user_role']
        : deserializeEnum<UserRole>(snapshotData['user_role']);
    _lastReadNotification = snapshotData['last_read_notification'] as DateTime?;
    _myRedeemedCodes = getDataList(snapshotData['my_redeemed_codes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? title,
  bool? haveRead,
  String? ageRange,
  int? totalBooks,
  bool? anonymousUser,
  bool? notificationsDailyReminders,
  bool? notificationsNewBookAlerts,
  bool? notificationsUserLocation,
  DateTime? dailyPassLastActive,
  UserStatus? authorStatus,
  UserRole? userRole,
  DateTime? lastReadNotification,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'title': title,
      'haveRead': haveRead,
      'age_range': ageRange,
      'total_books': totalBooks,
      'anonymous_user': anonymousUser,
      'notifications_daily_reminders': notificationsDailyReminders,
      'notifications_new_book_alerts': notificationsNewBookAlerts,
      'notifications_user_location': notificationsUserLocation,
      'daily_pass_last_active': dailyPassLastActive,
      'author_status': authorStatus,
      'user_role': userRole,
      'last_read_notification': lastReadNotification,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.title == e2?.title &&
        e1?.haveRead == e2?.haveRead &&
        listEquality.equals(e1?.selectedTropes, e2?.selectedTropes) &&
        e1?.ageRange == e2?.ageRange &&
        e1?.totalBooks == e2?.totalBooks &&
        e1?.anonymousUser == e2?.anonymousUser &&
        e1?.notificationsDailyReminders == e2?.notificationsDailyReminders &&
        e1?.notificationsNewBookAlerts == e2?.notificationsNewBookAlerts &&
        e1?.notificationsUserLocation == e2?.notificationsUserLocation &&
        e1?.dailyPassLastActive == e2?.dailyPassLastActive &&
        e1?.authorStatus == e2?.authorStatus &&
        e1?.userRole == e2?.userRole &&
        e1?.lastReadNotification == e2?.lastReadNotification &&
        listEquality.equals(e1?.myRedeemedCodes, e2?.myRedeemedCodes);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.title,
        e?.haveRead,
        e?.selectedTropes,
        e?.ageRange,
        e?.totalBooks,
        e?.anonymousUser,
        e?.notificationsDailyReminders,
        e?.notificationsNewBookAlerts,
        e?.notificationsUserLocation,
        e?.dailyPassLastActive,
        e?.authorStatus,
        e?.userRole,
        e?.lastReadNotification,
        e?.myRedeemedCodes
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
