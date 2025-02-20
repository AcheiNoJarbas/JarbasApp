import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/golbal_components/forms/jarbas_search_bar/jarbas_search_bar_widget.dart';
import '/index.dart';
import 'list_contratacoes_widget.dart' show ListContratacoesWidget;
import 'package:flutter/material.dart';

class ListContratacoesModel extends FlutterFlowModel<ListContratacoesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for JarbasSearchBar component.
  late JarbasSearchBarModel jarbasSearchBarModel;
  List<ContratacoesRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    jarbasSearchBarModel = createModel(context, () => JarbasSearchBarModel());
  }

  @override
  void dispose() {
    jarbasSearchBarModel.dispose();
  }
}
