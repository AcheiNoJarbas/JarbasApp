import '/flutter_flow/flutter_flow_util.dart';
import '/golbal_components/nav_bar/nav_bar_widget.dart';
import '/index.dart';
import 'perfil_do_user_widget.dart' show PerfilDoUserWidget;
import 'package:flutter/material.dart';

class PerfilDoUserModel extends FlutterFlowModel<PerfilDoUserWidget> {
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
