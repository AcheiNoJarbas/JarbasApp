// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MuncipioSelecionadoStruct extends FFFirebaseStruct {
  MuncipioSelecionadoStruct({
    String? nome,
    String? municipioID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nome = nome,
        _municipioID = municipioID,
        super(firestoreUtilData);

  // "Nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "municipioID" field.
  String? _municipioID;
  String get municipioID => _municipioID ?? '';
  set municipioID(String? val) => _municipioID = val;

  bool hasMunicipioID() => _municipioID != null;

  static MuncipioSelecionadoStruct fromMap(Map<String, dynamic> data) =>
      MuncipioSelecionadoStruct(
        nome: data['Nome'] as String?,
        municipioID: data['municipioID'] as String?,
      );

  static MuncipioSelecionadoStruct? maybeFromMap(dynamic data) => data is Map
      ? MuncipioSelecionadoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Nome': _nome,
        'municipioID': _municipioID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'municipioID': serializeParam(
          _municipioID,
          ParamType.String,
        ),
      }.withoutNulls;

  static MuncipioSelecionadoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MuncipioSelecionadoStruct(
        nome: deserializeParam(
          data['Nome'],
          ParamType.String,
          false,
        ),
        municipioID: deserializeParam(
          data['municipioID'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MuncipioSelecionadoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MuncipioSelecionadoStruct &&
        nome == other.nome &&
        municipioID == other.municipioID;
  }

  @override
  int get hashCode => const ListEquality().hash([nome, municipioID]);
}

MuncipioSelecionadoStruct createMuncipioSelecionadoStruct({
  String? nome,
  String? municipioID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MuncipioSelecionadoStruct(
      nome: nome,
      municipioID: municipioID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MuncipioSelecionadoStruct? updateMuncipioSelecionadoStruct(
  MuncipioSelecionadoStruct? muncipioSelecionado, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    muncipioSelecionado
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMuncipioSelecionadoStructData(
  Map<String, dynamic> firestoreData,
  MuncipioSelecionadoStruct? muncipioSelecionado,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (muncipioSelecionado == null) {
    return;
  }
  if (muncipioSelecionado.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && muncipioSelecionado.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final muncipioSelecionadoData =
      getMuncipioSelecionadoFirestoreData(muncipioSelecionado, forFieldValue);
  final nestedData =
      muncipioSelecionadoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      muncipioSelecionado.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMuncipioSelecionadoFirestoreData(
  MuncipioSelecionadoStruct? muncipioSelecionado, [
  bool forFieldValue = false,
]) {
  if (muncipioSelecionado == null) {
    return {};
  }
  final firestoreData = mapToFirestore(muncipioSelecionado.toMap());

  // Add any Firestore field values
  muncipioSelecionado.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMuncipioSelecionadoListFirestoreData(
  List<MuncipioSelecionadoStruct>? muncipioSelecionados,
) =>
    muncipioSelecionados
        ?.map((e) => getMuncipioSelecionadoFirestoreData(e, true))
        .toList() ??
    [];
