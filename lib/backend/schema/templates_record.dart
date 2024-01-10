import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class TemplatesRecord extends FirestoreRecord {
  TemplatesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "TName" field.
  String? _tName;
  String get tName => _tName ?? '';
  bool hasTName() => _tName != null;

  // "TStandardFields" field.
  List<String>? _tStandardFields;
  List<String> get tStandardFields => _tStandardFields ?? const [];
  bool hasTStandardFields() => _tStandardFields != null;

  // "TCustomFields" field.
  List<String>? _tCustomFields;
  List<String> get tCustomFields => _tCustomFields ?? const [];
  bool hasTCustomFields() => _tCustomFields != null;

  // "Allowed" field.
  List<String>? _allowed;
  List<String> get allowed => _allowed ?? const [];
  bool hasAllowed() => _allowed != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tName = snapshotData['TName'] as String?;
    _tStandardFields = getDataList(snapshotData['TStandardFields']);
    _tCustomFields = getDataList(snapshotData['TCustomFields']);
    _allowed = getDataList(snapshotData['Allowed']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('templates')
          : FirebaseFirestore.instance.collectionGroup('templates');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('templates').doc();

  static Stream<TemplatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TemplatesRecord.fromSnapshot(s));

  static Future<TemplatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TemplatesRecord.fromSnapshot(s));

  static TemplatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TemplatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TemplatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TemplatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TemplatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TemplatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTemplatesRecordData({
  String? tName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'TName': tName,
    }.withoutNulls,
  );

  return firestoreData;
}

class TemplatesRecordDocumentEquality implements Equality<TemplatesRecord> {
  const TemplatesRecordDocumentEquality();

  @override
  bool equals(TemplatesRecord? e1, TemplatesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tName == e2?.tName &&
        listEquality.equals(e1?.tStandardFields, e2?.tStandardFields) &&
        listEquality.equals(e1?.tCustomFields, e2?.tCustomFields) &&
        listEquality.equals(e1?.allowed, e2?.allowed);
  }

  @override
  int hash(TemplatesRecord? e) => const ListEquality()
      .hash([e?.tName, e?.tStandardFields, e?.tCustomFields, e?.allowed]);

  @override
  bool isValidKey(Object? o) => o is TemplatesRecord;
}
