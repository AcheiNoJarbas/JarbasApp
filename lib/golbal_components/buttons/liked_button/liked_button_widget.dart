import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'liked_button_model.dart';
export 'liked_button_model.dart';

class LikedButtonWidget extends StatefulWidget {
  const LikedButtonWidget({
    super.key,
    required this.likeYes,
    required this.likeNo,
    bool? stateLike,
  }) : stateLike = stateLike ?? false;

  final Future Function()? likeYes;
  final Future Function()? likeNo;
  final bool stateLike;

  @override
  State<LikedButtonWidget> createState() => _LikedButtonWidgetState();
}

class _LikedButtonWidgetState extends State<LikedButtonWidget> {
  late LikedButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LikedButtonModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.clickLike = widget.stateLike;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (!_model.clickLike)
          FlutterFlowIconButton(
            borderRadius: 100.0,
            fillColor: FlutterFlowTheme.of(context).alternate,
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.black,
              size: 30.0,
            ),
            onPressed: () async {
              await widget.likeNo?.call();
              _model.clickLike = true;
              safeSetState(() {});
            },
          ),
        if (_model.clickLike)
          FlutterFlowIconButton(
            borderRadius: 100.0,
            fillColor: FlutterFlowTheme.of(context).alternate,
            icon: Icon(
              Icons.favorite_sharp,
              color: FlutterFlowTheme.of(context).tertiary,
              size: 30.0,
            ),
            onPressed: () async {
              await widget.likeYes?.call();
              _model.clickLike = false;
              safeSetState(() {});
            },
          ),
      ],
    );
  }
}
