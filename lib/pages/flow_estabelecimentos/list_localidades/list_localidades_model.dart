import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/golbal_components/forms/jarbas_search_bar/jarbas_search_bar_widget.dart';
import '/index.dart';
import 'list_localidades_widget.dart' show ListLocalidadesWidget;
import 'package:flutter/material.dart';

class ListLocalidadesModel extends FlutterFlowModel<ListLocalidadesWidget> {
  ///  Local state fields for this page.

  bool reload = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ListLocalidades widget.
  List<BairrosRecord>? resultOfRequestBairros;
  // Model for JarbasSearchBar component.
  late JarbasSearchBarModel jarbasSearchBarModel;
  List<BairrosRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    jarbasSearchBarModel = createModel(context, () => JarbasSearchBarModel());
  }

  @override
  void dispose() {
    jarbasSearchBarModel.dispose();
  }
}
