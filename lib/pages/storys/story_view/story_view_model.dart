import '/backend/backend.dart';
import '/components/jarbas_carrousel_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'story_view_widget.dart' show StoryViewWidget;
import 'package:flutter/material.dart';

class StoryViewModel extends FlutterFlowModel<StoryViewWidget> {
  ///  Local state fields for this page.

  bool reload = false;

  bool relloadPage = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in storyView widget.
  List<StorysRecord>? storysByEmpresaID;
  // Model for JarbasCarrousel component.
  late JarbasCarrouselModel jarbasCarrouselModel;

  @override
  void initState(BuildContext context) {
    jarbasCarrouselModel = createModel(context, () => JarbasCarrouselModel());
  }

  @override
  void dispose() {
    jarbasCarrouselModel.dispose();
  }
}
