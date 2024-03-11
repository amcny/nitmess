// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FbStatusStruct extends FFFirebaseStruct {
  FbStatusStruct({
    String? mgmt,
    String? radio,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mgmt = mgmt,
        _radio = radio,
        super(firestoreUtilData);

  // "mgmt" field.
  String? _mgmt;
  String get mgmt => _mgmt ?? '';
  set mgmt(String? val) => _mgmt = val;
  bool hasMgmt() => _mgmt != null;

  // "radio" field.
  String? _radio;
  String get radio => _radio ?? '';
  set radio(String? val) => _radio = val;
  bool hasRadio() => _radio != null;

  static FbStatusStruct fromMap(Map<String, dynamic> data) => FbStatusStruct(
        mgmt: data['mgmt'] as String?,
        radio: data['radio'] as String?,
      );

  static FbStatusStruct? maybeFromMap(dynamic data) =>
      data is Map ? FbStatusStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'mgmt': _mgmt,
        'radio': _radio,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mgmt': serializeParam(
          _mgmt,
          ParamType.String,
        ),
        'radio': serializeParam(
          _radio,
          ParamType.String,
        ),
      }.withoutNulls;

  static FbStatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      FbStatusStruct(
        mgmt: deserializeParam(
          data['mgmt'],
          ParamType.String,
          false,
        ),
        radio: deserializeParam(
          data['radio'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FbStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FbStatusStruct &&
        mgmt == other.mgmt &&
        radio == other.radio;
  }

  @override
  int get hashCode => const ListEquality().hash([mgmt, radio]);
}

FbStatusStruct createFbStatusStruct({
  String? mgmt,
  String? radio,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FbStatusStruct(
      mgmt: mgmt,
      radio: radio,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FbStatusStruct? updateFbStatusStruct(
  FbStatusStruct? fbStatus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    fbStatus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFbStatusStructData(
  Map<String, dynamic> firestoreData,
  FbStatusStruct? fbStatus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fbStatus == null) {
    return;
  }
  if (fbStatus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && fbStatus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fbStatusData = getFbStatusFirestoreData(fbStatus, forFieldValue);
  final nestedData = fbStatusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = fbStatus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFbStatusFirestoreData(
  FbStatusStruct? fbStatus, [
  bool forFieldValue = false,
]) {
  if (fbStatus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fbStatus.toMap());

  // Add any Firestore field values
  fbStatus.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFbStatusListFirestoreData(
  List<FbStatusStruct>? fbStatuss,
) =>
    fbStatuss?.map((e) => getFbStatusFirestoreData(e, true)).toList() ?? [];
