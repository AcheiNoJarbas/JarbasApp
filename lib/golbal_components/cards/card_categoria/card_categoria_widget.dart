import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'card_categoria_model.dart';
export 'card_categoria_model.dart';

class CardCategoriaWidget extends StatefulWidget {
  const CardCategoriaWidget({
    super.key,
    required this.objectDocument,
    required this.cardFunction,
  });

  final CategoriasRecord? objectDocument;
  final Future Function()? cardFunction;

  @override
  State<CardCategoriaWidget> createState() => _CardCategoriaWidgetState();
}

class _CardCategoriaWidgetState extends State<CardCategoriaWidget> {
  late CardCategoriaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardCategoriaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await widget.cardFunction?.call();
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.22,
          decoration: BoxDecoration(
            color: Color(0x00FFFFFF),
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 100.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: Color(0x00FFFFFF),
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (widget.objectDocument?.imageUrl != null &&
                          widget.objectDocument?.imageUrl != '')
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            '${widget.objectDocument?.imageUrl}',
                            width: 100.0,
                            height: 80.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      if (widget.objectDocument?.imageUrl == null ||
                          widget.objectDocument?.imageUrl == '')
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Imagem_do_WhatsApp_de_2024-11-04_(s)_16.26.23_57357408.jpg',
                            width: 100.0,
                            height: 80.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: AutoSizeText(
                      valueOrDefault<String>(
                        widget.objectDocument?.nome,
                        'Nome da categoria',
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 5.0)),
            ),
          ),
        ),
      ),
    );
  }
}
