import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/golbal_components/forms/jarbas_search_bar/jarbas_search_bar_widget.dart';
import 'escolha_widget.dart' show EscolhaWidget;
import 'package:flutter/material.dart';

class EscolhaModel extends FlutterFlowModel<EscolhaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for JarbasSearchBar component.
  late JarbasSearchBarModel jarbasSearchBarModel;
  List<MunicipiosRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    jarbasSearchBarModel = createModel(context, () => JarbasSearchBarModel());
  }

  @override
  void dispose() {
    jarbasSearchBarModel.dispose();
  }
}
