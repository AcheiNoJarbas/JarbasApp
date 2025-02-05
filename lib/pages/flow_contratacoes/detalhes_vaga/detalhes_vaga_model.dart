import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detalhes_vaga_widget.dart' show DetalhesVagaWidget;
import 'package:flutter/material.dart';

class DetalhesVagaModel extends FlutterFlowModel<DetalhesVagaWidget> {
  ///  Local state fields for this page.

  bool reload = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in DetalhesVaga widget.
  ContratacoesRecord? resultQueryContratacaoByID;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  EmpresasRecord? empresaById;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
