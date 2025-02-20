import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/golbal_components/forms/jarbas_search_bar/jarbas_search_bar_widget.dart';
import '/index.dart';
import 'list_estabelecimentos_widget.dart' show ListEstabelecimentosWidget;
import 'package:flutter/material.dart';

class ListEstabelecimentosModel
    extends FlutterFlowModel<ListEstabelecimentosWidget> {
  ///  Local state fields for this page.

  bool reload = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ListEstabelecimentos widget.
  List<EmpresasRecord>? resultOfListEmpresas;
  // Stores action output result for [Firestore Query - Query a collection] action in ListEstabelecimentos widget.
  BairrosRecord? bairroSelected;
  // Model for JarbasSearchBar component.
  late JarbasSearchBarModel jarbasSearchBarModel;
  List<EmpresasRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    jarbasSearchBarModel = createModel(context, () => JarbasSearchBarModel());
  }

  @override
  void dispose() {
    jarbasSearchBarModel.dispose();
  }
}
