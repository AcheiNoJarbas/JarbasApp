import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';

Future<String> uploadMedia(
  BuildContext context, {
  required FFUploadedFile? uploadFile,
  required bool? hasUploadFile,
  required String? bucketName,
  required String? folderName,
}) async {
  String? uploadMediaUrl;

  if (hasUploadFile!) {
    uploadMediaUrl = await actions.uploadFileToSupabase(
      bucketName!,
      folderName!,
      uploadFile!,
    );
    return uploadMediaUrl;
  } else {
    return '\"\"';
  }
}
