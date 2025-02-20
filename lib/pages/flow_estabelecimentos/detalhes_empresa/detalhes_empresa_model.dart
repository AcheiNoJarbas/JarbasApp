import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'detalhes_empresa_widget.dart' show DetalhesEmpresaWidget;
import 'package:flutter/material.dart';

class DetalhesEmpresaModel extends FlutterFlowModel<DetalhesEmpresaWidget> {
  ///  Local state fields for this page.

  bool reload = false;

  bool empresaIsFavorit = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in DetalhesEmpresa widget.
  EmpresasRecord? resultRequestOfEmpresaByID;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
