import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class StandardCompsRecord extends FirestoreRecord {
  StandardCompsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "OptionalData" field.
  List<String>? _optionalData;
  List<String> get optionalData => _optionalData ?? const [];
  bool hasOptionalData() => _optionalData != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _type = snapshotData['Type'] as String?;
    _optionalData = getDataList(snapshotData['OptionalData']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('standardComps');

  static Stream<StandardCompsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StandardCompsRecord.fromSnapshot(s));

  static Future<StandardCompsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StandardCompsRecord.fromSnapshot(s));

  static StandardCompsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StandardCompsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StandardCompsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StandardCompsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StandardCompsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StandardCompsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStandardCompsRecordData({
  String? name,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class StandardCompsRecordDocumentEquality
    implements Equality<StandardCompsRecord> {
  const StandardCompsRecordDocumentEquality();

  @override
  bool equals(StandardCompsRecord? e1, StandardCompsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.type == e2?.type &&
        listEquality.equals(e1?.optionalData, e2?.optionalData);
  }

  @override
  int hash(StandardCompsRecord? e) =>
      const ListEquality().hash([e?.name, e?.type, e?.optionalData]);

  @override
  bool isValidKey(Object? o) => o is StandardCompsRecord;
}
