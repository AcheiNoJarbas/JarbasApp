import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ApresentacaoRecord extends FirestoreRecord {
  ApresentacaoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "empresaID" field.
  String? _empresaID;
  String get empresaID => _empresaID ?? '';
  bool hasEmpresaID() => _empresaID != null;

  // "bannerUrl" field.
  String? _bannerUrl;
  String get bannerUrl => _bannerUrl ?? '';
  bool hasBannerUrl() => _bannerUrl != null;

  // "fotoUrl" field.
  String? _fotoUrl;
  String get fotoUrl => _fotoUrl ?? '';
  bool hasFotoUrl() => _fotoUrl != null;

  // "serviceValue" field.
  String? _serviceValue;
  String get serviceValue => _serviceValue ?? '';
  bool hasServiceValue() => _serviceValue != null;

  void _initializeFields() {
    _empresaID = snapshotData['empresaID'] as String?;
    _bannerUrl = snapshotData['bannerUrl'] as String?;
    _fotoUrl = snapshotData['fotoUrl'] as String?;
    _serviceValue = snapshotData['serviceValue'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('apresentacao');

  static Stream<ApresentacaoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ApresentacaoRecord.fromSnapshot(s));

  static Future<ApresentacaoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ApresentacaoRecord.fromSnapshot(s));

  static ApresentacaoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ApresentacaoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ApresentacaoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ApresentacaoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ApresentacaoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ApresentacaoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createApresentacaoRecordData({
  String? empresaID,
  String? bannerUrl,
  String? fotoUrl,
  String? serviceValue,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'empresaID': empresaID,
      'bannerUrl': bannerUrl,
      'fotoUrl': fotoUrl,
      'serviceValue': serviceValue,
    }.withoutNulls,
  );

  return firestoreData;
}

class ApresentacaoRecordDocumentEquality
    implements Equality<ApresentacaoRecord> {
  const ApresentacaoRecordDocumentEquality();

  @override
  bool equals(ApresentacaoRecord? e1, ApresentacaoRecord? e2) {
    return e1?.empresaID == e2?.empresaID &&
        e1?.bannerUrl == e2?.bannerUrl &&
        e1?.fotoUrl == e2?.fotoUrl &&
        e1?.serviceValue == e2?.serviceValue;
  }

  @override
  int hash(ApresentacaoRecord? e) => const ListEquality()
      .hash([e?.empresaID, e?.bannerUrl, e?.fotoUrl, e?.serviceValue]);

  @override
  bool isValidKey(Object? o) => o is ApresentacaoRecord;
}
