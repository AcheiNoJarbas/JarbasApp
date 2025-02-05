import '/flutter_flow/flutter_flow_util.dart';
import '/golbal_components/buttons/jarbas_large_button/jarbas_large_button_widget.dart';
import '/golbal_components/forms/input_banner/input_banner_widget.dart';
import '/golbal_components/forms/input_foto_circle/input_foto_circle_widget.dart';
import '/golbal_components/forms/input_phone/input_phone_widget.dart';
import '/golbal_components/forms/input_text/input_text_widget.dart';
import 'perfil_editor_widget.dart' show PerfilEditorWidget;
import 'package:flutter/material.dart';

class PerfilEditorModel extends FlutterFlowModel<PerfilEditorWidget> {
  ///  Local state fields for this page.

  bool reload = false;

  ///  State fields for stateful widgets in this page.

  // Model for InputFotoCircle component.
  late InputFotoCircleModel inputFotoCircleModel;
  // Model for inputBanner component.
  late InputBannerModel inputBannerModel;
  // Model for Nome.
  late InputTextModel nomeModel;
  // Model for Email.
  late InputTextModel emailModel;
  // Model for inputPhone component.
  late InputPhoneModel inputPhoneModel;
  // Model for JarbasLargeButton component.
  late JarbasLargeButtonModel jarbasLargeButtonModel;
  // Stores action output result for [Action Block - uploadMedia] action in JarbasLargeButton widget.
  String? fotoUrl;
  // Stores action output result for [Action Block - uploadMedia] action in JarbasLargeButton widget.
  String? bannerUrl;

  @override
  void initState(BuildContext context) {
    inputFotoCircleModel = createModel(context, () => InputFotoCircleModel());
    inputBannerModel = createModel(context, () => InputBannerModel());
    nomeModel = createModel(context, () => InputTextModel());
    emailModel = createModel(context, () => InputTextModel());
    inputPhoneModel = createModel(context, () => InputPhoneModel());
    jarbasLargeButtonModel =
        createModel(context, () => JarbasLargeButtonModel());
  }

  @override
  void dispose() {
    inputFotoCircleModel.dispose();
    inputBannerModel.dispose();
    nomeModel.dispose();
    emailModel.dispose();
    inputPhoneModel.dispose();
    jarbasLargeButtonModel.dispose();
  }
}
