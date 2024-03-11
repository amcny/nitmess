import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbackRecord extends FirestoreRecord {
  FeedbackRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "mealname" field.
  String? _mealname;
  String get mealname => _mealname ?? '';
  bool hasMealname() => _mealname != null;

  // "food_rating" field.
  double? _foodRating;
  double get foodRating => _foodRating ?? 0.0;
  bool hasFoodRating() => _foodRating != null;

  // "service_rating" field.
  double? _serviceRating;
  double get serviceRating => _serviceRating ?? 0.0;
  bool hasServiceRating() => _serviceRating != null;

  // "hygiene_rating" field.
  double? _hygieneRating;
  double get hygieneRating => _hygieneRating ?? 0.0;
  bool hasHygieneRating() => _hygieneRating != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "images" field.
  String? _images;
  String get images => _images ?? '';
  bool hasImages() => _images != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "session" field.
  String? _session;
  String get session => _session ?? '';
  bool hasSession() => _session != null;

  // "fb_doc" field.
  FbStatusStruct? _fbDoc;
  FbStatusStruct get fbDoc => _fbDoc ?? FbStatusStruct();
  bool hasFbDoc() => _fbDoc != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _mealname = snapshotData['mealname'] as String?;
    _foodRating = castToType<double>(snapshotData['food_rating']);
    _serviceRating = castToType<double>(snapshotData['service_rating']);
    _hygieneRating = castToType<double>(snapshotData['hygiene_rating']);
    _description = snapshotData['description'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _images = snapshotData['images'] as String?;
    _uid = snapshotData['uid'] as String?;
    _session = snapshotData['session'] as String?;
    _fbDoc = FbStatusStruct.maybeFromMap(snapshotData['fb_doc']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feedback');

  static Stream<FeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbackRecord.fromSnapshot(s));

  static Future<FeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedbackRecord.fromSnapshot(s));

  static FeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbackRecordData({
  String? email,
  String? mealname,
  double? foodRating,
  double? serviceRating,
  double? hygieneRating,
  String? description,
  DateTime? timestamp,
  String? images,
  String? uid,
  String? session,
  FbStatusStruct? fbDoc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'mealname': mealname,
      'food_rating': foodRating,
      'service_rating': serviceRating,
      'hygiene_rating': hygieneRating,
      'description': description,
      'timestamp': timestamp,
      'images': images,
      'uid': uid,
      'session': session,
      'fb_doc': FbStatusStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "fb_doc" field.
  addFbStatusStructData(firestoreData, fbDoc, 'fb_doc');

  return firestoreData;
}

class FeedbackRecordDocumentEquality implements Equality<FeedbackRecord> {
  const FeedbackRecordDocumentEquality();

  @override
  bool equals(FeedbackRecord? e1, FeedbackRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.mealname == e2?.mealname &&
        e1?.foodRating == e2?.foodRating &&
        e1?.serviceRating == e2?.serviceRating &&
        e1?.hygieneRating == e2?.hygieneRating &&
        e1?.description == e2?.description &&
        e1?.timestamp == e2?.timestamp &&
        e1?.images == e2?.images &&
        e1?.uid == e2?.uid &&
        e1?.session == e2?.session &&
        e1?.fbDoc == e2?.fbDoc;
  }

  @override
  int hash(FeedbackRecord? e) => const ListEquality().hash([
        e?.email,
        e?.mealname,
        e?.foodRating,
        e?.serviceRating,
        e?.hygieneRating,
        e?.description,
        e?.timestamp,
        e?.images,
        e?.uid,
        e?.session,
        e?.fbDoc
      ]);

  @override
  bool isValidKey(Object? o) => o is FeedbackRecord;
}
