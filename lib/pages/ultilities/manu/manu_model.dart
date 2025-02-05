import '/flutter_flow/flutter_flow_util.dart';
import '/golbal_components/nav_bar/nav_bar_widget.dart';
import 'manu_widget.dart' show ManuWidget;
import 'package:flutter/material.dart';

class ManuModel extends FlutterFlowModel<ManuWidget> {
  ///  Local state fields for this page.

  String? menu;

  ///  State fields for stateful widgets in this page.

  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
