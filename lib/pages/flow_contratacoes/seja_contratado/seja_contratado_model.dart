import '/flutter_flow/flutter_flow_util.dart';
import '/golbal_components/buttons/jarbas_large_button/jarbas_large_button_widget.dart';
import 'seja_contratado_widget.dart' show SejaContratadoWidget;
import 'package:flutter/material.dart';

class SejaContratadoModel extends FlutterFlowModel<SejaContratadoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for JarbasLargeButton component.
  late JarbasLargeButtonModel jarbasLargeButtonModel;

  @override
  void initState(BuildContext context) {
    jarbasLargeButtonModel =
        createModel(context, () => JarbasLargeButtonModel());
  }

  @override
  void dispose() {
    jarbasLargeButtonModel.dispose();
  }
}
