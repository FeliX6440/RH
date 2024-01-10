import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CustomDropdownsRecord extends FirestoreRecord {
  CustomDropdownsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Objects" field.
  List<String>? _objects;
  List<String> get objects => _objects ?? const [];
  bool hasObjects() => _objects != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _objects = getDataList(snapshotData['Objects']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('customDropdowns')
          : FirebaseFirestore.instance.collectionGroup('customDropdowns');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('customDropdowns').doc();

  static Stream<CustomDropdownsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomDropdownsRecord.fromSnapshot(s));

  static Future<CustomDropdownsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomDropdownsRecord.fromSnapshot(s));

  static CustomDropdownsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomDropdownsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomDropdownsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomDropdownsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomDropdownsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomDropdownsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomDropdownsRecordData({
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomDropdownsRecordDocumentEquality
    implements Equality<CustomDropdownsRecord> {
  const CustomDropdownsRecordDocumentEquality();

  @override
  bool equals(CustomDropdownsRecord? e1, CustomDropdownsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        listEquality.equals(e1?.objects, e2?.objects);
  }

  @override
  int hash(CustomDropdownsRecord? e) =>
      const ListEquality().hash([e?.title, e?.objects]);

  @override
  bool isValidKey(Object? o) => o is CustomDropdownsRecord;
}
