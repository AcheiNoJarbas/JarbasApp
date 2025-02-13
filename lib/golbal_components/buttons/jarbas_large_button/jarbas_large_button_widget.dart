import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'jarbas_large_button_model.dart';
export 'jarbas_large_button_model.dart';

class JarbasLargeButtonWidget extends StatefulWidget {
  const JarbasLargeButtonWidget({
    super.key,
    String? textButton,
    required this.buttonAction,
  }) : this.textButton = textButton ?? 'TextButton';

  final String textButton;
  final Future Function()? buttonAction;

  @override
  State<JarbasLargeButtonWidget> createState() =>
      _JarbasLargeButtonWidgetState();
}

class _JarbasLargeButtonWidgetState extends State<JarbasLargeButtonWidget> {
  late JarbasLargeButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JarbasLargeButtonModel());

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
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
        borderRadius: BorderRadius.circular(10.0),
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
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 40.0,
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: Color(0x003751A6),
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
