import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'jarbas_small_button_model.dart';
export 'jarbas_small_button_model.dart';

class JarbasSmallButtonWidget extends StatefulWidget {
  const JarbasSmallButtonWidget({
    super.key,
    String? textButton,
    required this.buttonAction,
  }) : textButton = textButton ?? 'TextButton';

  final String textButton;
  final Future Function()? buttonAction;

  @override
  State<JarbasSmallButtonWidget> createState() =>
      _JarbasSmallButtonWidgetState();
}

class _JarbasSmallButtonWidgetState extends State<JarbasSmallButtonWidget> {
  late JarbasSmallButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JarbasSmallButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).primary,
            FlutterFlowTheme.of(context).tertiary
          ],
          stops: const [0.0, 1.0],
          begin: const AlignmentDirectional(0.0, -1.0),
          end: const AlignmentDirectional(0, 1.0),
        ),
      ),
      child: FFButtonWidget(
        onPressed: () async {
          await widget.buttonAction?.call();
        },
        text: valueOrDefault<String>(
          widget.textButton,
          'Title',
        ),
        options: FFButtonOptions(
          width: MediaQuery.sizeOf(context).width * 0.4,
          height: 40.0,
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: const Color(0x003751A6),
          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'Inter Tight',
                color: Colors.white,
                fontSize: 18.0,
                letterSpacing: 0.0,
              ),
          elevation: 0.0,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
