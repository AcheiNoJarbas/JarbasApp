import '/flutter_flow/flutter_flow_util.dart';
import 'input_banner_widget.dart' show InputBannerWidget;
import 'package:flutter/material.dart';

class InputBannerModel extends FlutterFlowModel<InputBannerWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? uploadFile;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
