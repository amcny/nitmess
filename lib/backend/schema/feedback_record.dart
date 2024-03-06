import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

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

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _mealname = snapshotData['mealname'] as String?;
    _foodRating = castToType<double>(snapshotData['food_rating']);
    _serviceRating = castToType<double>(snapshotData['service_rating']);
    _hygieneRating = castToType<double>(snapshotData['hygiene_rating']);
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
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
  String? image,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'mealname': mealname,
      'food_rating': foodRating,
      'service_rating': serviceRating,
      'hygiene_rating': hygieneRating,
      'description': description,
      'image': image,
      'timestamp': timestamp,
    }.withoutNulls,
  );

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
        e1?.image == e2?.image &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(FeedbackRecord? e) => const ListEquality().hash([
        e?.email,
        e?.mealname,
        e?.foodRating,
        e?.serviceRating,
        e?.hygieneRating,
        e?.description,
        e?.image,
        e?.timestamp
      ]);

  @override
  bool isValidKey(Object? o) => o is FeedbackRecord;
}
