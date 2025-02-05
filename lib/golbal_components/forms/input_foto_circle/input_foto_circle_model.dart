import '/flutter_flow/flutter_flow_util.dart';
import 'input_foto_circle_widget.dart' show InputFotoCircleWidget;
import 'package:flutter/material.dart';

class InputFotoCircleModel extends FlutterFlowModel<InputFotoCircleWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? upload;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
