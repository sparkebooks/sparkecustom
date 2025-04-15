import 'package:collection/collection.dart';

enum SelectedTypography {
  PTSerif,
  Figtree,
  OpenSans,
}

enum BookPreviewType {
  Reading,
  Popular,
  Search,
  JustOut,
}

enum Type {
  Popular,
  Regular,
}

enum TransactionType {
  USD,
  COIN,
  REFERRAL,
}

enum UserStatus {
  Pending_Review,
  Registered,
  Approved,
  Rejected,
  Paused,
}

enum UserRole {
  Customer,
  Author,
  Moderator,
  Support,
  Manager,
  Admin,
}

enum CommentStatus {
  Pending,
  Approved,
  Reported,
  Archived,
}

enum BadWords {
  Fuck,
  Shit,
  badWords,
  GoodNovel,
  Dreame,
  WattPad,
  AnyStories,
  Nigga,
}

enum BookStatus {
  Draft,
  Pending,
  Moderation,
  Rejected,
  Archived,
  Published,
}

enum HomeBannerTypes {
  Book,
  Referral,
  Trope,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (SelectedTypography):
      return SelectedTypography.values.deserialize(value) as T?;
    case (BookPreviewType):
      return BookPreviewType.values.deserialize(value) as T?;
    case (Type):
      return Type.values.deserialize(value) as T?;
    case (TransactionType):
      return TransactionType.values.deserialize(value) as T?;
    case (UserStatus):
      return UserStatus.values.deserialize(value) as T?;
    case (UserRole):
      return UserRole.values.deserialize(value) as T?;
    case (CommentStatus):
      return CommentStatus.values.deserialize(value) as T?;
    case (BadWords):
      return BadWords.values.deserialize(value) as T?;
    case (BookStatus):
      return BookStatus.values.deserialize(value) as T?;
    case (HomeBannerTypes):
      return HomeBannerTypes.values.deserialize(value) as T?;
    default:
      return null;
  }
}
