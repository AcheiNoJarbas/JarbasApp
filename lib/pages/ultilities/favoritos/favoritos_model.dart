import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/golbal_components/nav_bar/nav_bar_widget.dart';
import '/index.dart';
import 'favoritos_widget.dart' show FavoritosWidget;
import 'package:flutter/material.dart';

class FavoritosModel extends FlutterFlowModel<FavoritosWidget> {
  ///  Local state fields for this page.

  bool reload = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in favoritos widget.
  List<EmpresasRecord>? empresasFavoritas;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<EmpresasRecord> simpleSearchResults = [];
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navBarModel.dispose();
  }
}
