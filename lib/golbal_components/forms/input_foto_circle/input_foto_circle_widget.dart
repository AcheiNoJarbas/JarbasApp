import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'input_foto_circle_model.dart';
export 'input_foto_circle_model.dart';

class InputFotoCircleWidget extends StatefulWidget {
  const InputFotoCircleWidget({
    super.key,
    this.url,
    this.label,
  });

  final String? url;
  final String? label;

  @override
  State<InputFotoCircleWidget> createState() => _InputFotoCircleWidgetState();
}

class _InputFotoCircleWidgetState extends State<InputFotoCircleWidget> {
  late InputFotoCircleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputFotoCircleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          valueOrDefault<String>(
            widget.label,
            'Label',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                fontSize: 18.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
              ),
        ),
        ClipRRect(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.5,
            height: MediaQuery.sizeOf(context).height * 0.25,
            decoration: const BoxDecoration(
              color: Color(0x00FFFFFF),
            ),
            child: Stack(
              children: [
                ClipOval(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                    child: Builder(
                      builder: (context) {
                        if ((widget.url != null && widget.url != '') &&
                            (_model.upload == null ||
                                (_model.upload?.bytes?.isEmpty ?? true))) {
                          return Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              '${widget.url}',
                              fit: BoxFit.cover,
                            ),
                          );
                        } else if (_model.upload != null &&
                            (_model.upload?.bytes?.isNotEmpty ?? false)) {
                          return Container(
                            width: 200.0,
                            height: 200.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.memory(
                              _model.upload?.bytes ?? Uint8List.fromList([]),
                              fit: BoxFit.cover,
                            ),
                          );
                        } else {
                          return Icon(
                            Icons.image_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 100.0,
                          );
                        }
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.92, 0.91),
                  child: FlutterFlowIconButton(
                    borderRadius: 100.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.image_outlined,
                      color: FlutterFlowTheme.of(context).info,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      final selectedMedia =
                          await selectMediaWithSourceBottomSheet(
                        context: context,
                        allowPhoto: true,
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        safeSetState(() => _model.isDataUploading = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];

                        try {
                          selectedUploadedFiles = selectedMedia
                              .map((m) => FFUploadedFile(
                                    name: m.storagePath.split('/').last,
                                    bytes: m.bytes,
                                    height: m.dimensions?.height,
                                    width: m.dimensions?.width,
                                    blurHash: m.blurHash,
                                  ))
                              .toList();
                        } finally {
                          _model.isDataUploading = false;
                        }
                        if (selectedUploadedFiles.length ==
                            selectedMedia.length) {
                          safeSetState(() {
                            _model.uploadedLocalFile =
                                selectedUploadedFiles.first;
                          });
                        } else {
                          safeSetState(() {});
                          return;
                        }
                      }

                      _model.upload = _model.uploadedLocalFile;
                      safeSetState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
