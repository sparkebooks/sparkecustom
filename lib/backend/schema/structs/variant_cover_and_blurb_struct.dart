// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class VariantCoverAndBlurbStruct extends FFFirebaseStruct {
  VariantCoverAndBlurbStruct({
    String? blurb,
    String? coverImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _blurb = blurb,
        _coverImage = coverImage,
        super(firestoreUtilData);

  // "blurb" field.
  String? _blurb;
  String get blurb => _blurb ?? '';
  set blurb(String? val) => _blurb = val;

  bool hasBlurb() => _blurb != null;

  // "cover_image" field.
  String? _coverImage;
  String get coverImage => _coverImage ?? '';
  set coverImage(String? val) => _coverImage = val;

  bool hasCoverImage() => _coverImage != null;

  static VariantCoverAndBlurbStruct fromMap(Map<String, dynamic> data) =>
      VariantCoverAndBlurbStruct(
        blurb: data['blurb'] as String?,
        coverImage: data['cover_image'] as String?,
      );

  static VariantCoverAndBlurbStruct? maybeFromMap(dynamic data) => data is Map
      ? VariantCoverAndBlurbStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'blurb': _blurb,
        'cover_image': _coverImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'blurb': serializeParam(
          _blurb,
          ParamType.String,
        ),
        'cover_image': serializeParam(
          _coverImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static VariantCoverAndBlurbStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      VariantCoverAndBlurbStruct(
        blurb: deserializeParam(
          data['blurb'],
          ParamType.String,
          false,
        ),
        coverImage: deserializeParam(
          data['cover_image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VariantCoverAndBlurbStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VariantCoverAndBlurbStruct &&
        blurb == other.blurb &&
        coverImage == other.coverImage;
  }

  @override
  int get hashCode => const ListEquality().hash([blurb, coverImage]);
}

VariantCoverAndBlurbStruct createVariantCoverAndBlurbStruct({
  String? blurb,
  String? coverImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VariantCoverAndBlurbStruct(
      blurb: blurb,
      coverImage: coverImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VariantCoverAndBlurbStruct? updateVariantCoverAndBlurbStruct(
  VariantCoverAndBlurbStruct? variantCoverAndBlurb, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    variantCoverAndBlurb
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVariantCoverAndBlurbStructData(
  Map<String, dynamic> firestoreData,
  VariantCoverAndBlurbStruct? variantCoverAndBlurb,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (variantCoverAndBlurb == null) {
    return;
  }
  if (variantCoverAndBlurb.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && variantCoverAndBlurb.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final variantCoverAndBlurbData =
      getVariantCoverAndBlurbFirestoreData(variantCoverAndBlurb, forFieldValue);
  final nestedData =
      variantCoverAndBlurbData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      variantCoverAndBlurb.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVariantCoverAndBlurbFirestoreData(
  VariantCoverAndBlurbStruct? variantCoverAndBlurb, [
  bool forFieldValue = false,
]) {
  if (variantCoverAndBlurb == null) {
    return {};
  }
  final firestoreData = mapToFirestore(variantCoverAndBlurb.toMap());

  // Add any Firestore field values
  variantCoverAndBlurb.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVariantCoverAndBlurbListFirestoreData(
  List<VariantCoverAndBlurbStruct>? variantCoverAndBlurbs,
) =>
    variantCoverAndBlurbs
        ?.map((e) => getVariantCoverAndBlurbFirestoreData(e, true))
        .toList() ??
    [];
