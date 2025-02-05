import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmpresasRecord extends FirestoreRecord {
  EmpresasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "telefone" field.
  String? _telefone;
  String get telefone => _telefone ?? '';
  bool hasTelefone() => _telefone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "municipios" field.
  List<String>? _municipios;
  List<String> get municipios => _municipios ?? const [];
  bool hasMunicipios() => _municipios != null;

  // "bairros" field.
  List<String>? _bairros;
  List<String> get bairros => _bairros ?? const [];
  bool hasBairros() => _bairros != null;

  // "categorias" field.
  List<String>? _categorias;
  List<String> get categorias => _categorias ?? const [];
  bool hasCategorias() => _categorias != null;

  // "empresaID" field.
  String? _empresaID;
  String get empresaID => _empresaID ?? '';
  bool hasEmpresaID() => _empresaID != null;

  // "fotoUrl" field.
  String? _fotoUrl;
  String get fotoUrl => _fotoUrl ?? '';
  bool hasFotoUrl() => _fotoUrl != null;

  // "bannerUrl" field.
  String? _bannerUrl;
  String get bannerUrl => _bannerUrl ?? '';
  bool hasBannerUrl() => _bannerUrl != null;

  // "taxaExistencia" field.
  String? _taxaExistencia;
  String get taxaExistencia => _taxaExistencia ?? '';
  bool hasTaxaExistencia() => _taxaExistencia != null;

  // "taxaDestaque" field.
  String? _taxaDestaque;
  String get taxaDestaque => _taxaDestaque ?? '';
  bool hasTaxaDestaque() => _taxaDestaque != null;

  // "inDestaque" field.
  bool? _inDestaque;
  bool get inDestaque => _inDestaque ?? false;
  bool hasInDestaque() => _inDestaque != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _telefone = snapshotData['telefone'] as String?;
    _email = snapshotData['email'] as String?;
    _municipios = getDataList(snapshotData['municipios']);
    _bairros = getDataList(snapshotData['bairros']);
    _categorias = getDataList(snapshotData['categorias']);
    _empresaID = snapshotData['empresaID'] as String?;
    _fotoUrl = snapshotData['fotoUrl'] as String?;
    _bannerUrl = snapshotData['bannerUrl'] as String?;
    _taxaExistencia = snapshotData['taxaExistencia'] as String?;
    _taxaDestaque = snapshotData['taxaDestaque'] as String?;
    _inDestaque = snapshotData['inDestaque'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('empresas');

  static Stream<EmpresasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmpresasRecord.fromSnapshot(s));

  static Future<EmpresasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmpresasRecord.fromSnapshot(s));

  static EmpresasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmpresasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmpresasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmpresasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmpresasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmpresasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmpresasRecordData({
  String? nome,
  String? descricao,
  String? telefone,
  String? email,
  String? empresaID,
  String? fotoUrl,
  String? bannerUrl,
  String? taxaExistencia,
  String? taxaDestaque,
  bool? inDestaque,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'descricao': descricao,
      'telefone': telefone,
      'email': email,
      'empresaID': empresaID,
      'fotoUrl': fotoUrl,
      'bannerUrl': bannerUrl,
      'taxaExistencia': taxaExistencia,
      'taxaDestaque': taxaDestaque,
      'inDestaque': inDestaque,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmpresasRecordDocumentEquality implements Equality<EmpresasRecord> {
  const EmpresasRecordDocumentEquality();

  @override
  bool equals(EmpresasRecord? e1, EmpresasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nome == e2?.nome &&
        e1?.descricao == e2?.descricao &&
        e1?.telefone == e2?.telefone &&
        e1?.email == e2?.email &&
        listEquality.equals(e1?.municipios, e2?.municipios) &&
        listEquality.equals(e1?.bairros, e2?.bairros) &&
        listEquality.equals(e1?.categorias, e2?.categorias) &&
        e1?.empresaID == e2?.empresaID &&
        e1?.fotoUrl == e2?.fotoUrl &&
        e1?.bannerUrl == e2?.bannerUrl &&
        e1?.taxaExistencia == e2?.taxaExistencia &&
        e1?.taxaDestaque == e2?.taxaDestaque &&
        e1?.inDestaque == e2?.inDestaque;
  }

  @override
  int hash(EmpresasRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.descricao,
        e?.telefone,
        e?.email,
        e?.municipios,
        e?.bairros,
        e?.categorias,
        e?.empresaID,
        e?.fotoUrl,
        e?.bannerUrl,
        e?.taxaExistencia,
        e?.taxaDestaque,
        e?.inDestaque
      ]);

  @override
  bool isValidKey(Object? o) => o is EmpresasRecord;
}
