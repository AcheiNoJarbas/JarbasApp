import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboardings_widget.dart' show OnboardingsWidget;
import 'package:flutter/material.dart';

class OnboardingsModel extends FlutterFlowModel<OnboardingsWidget> {
  ///  Local state fields for this page.

  int? posicao = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
