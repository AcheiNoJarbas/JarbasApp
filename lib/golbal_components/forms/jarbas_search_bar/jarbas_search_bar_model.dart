import '/flutter_flow/flutter_flow_util.dart';
import 'jarbas_search_bar_widget.dart' show JarbasSearchBarWidget;
import 'package:flutter/material.dart';

class JarbasSearchBarModel extends FlutterFlowModel<JarbasSearchBarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
