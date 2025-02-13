import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/golbal_components/cards/card_contratacao/card_contratacao_widget.dart';
import '/golbal_components/forms/jarbas_search_bar/jarbas_search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'list_contratacoes_model.dart';
export 'list_contratacoes_model.dart';

class ListContratacoesWidget extends StatefulWidget {
  const ListContratacoesWidget({super.key});

  @override
  State<ListContratacoesWidget> createState() => _ListContratacoesWidgetState();
}

class _ListContratacoesWidgetState extends State<ListContratacoesWidget> {
  late ListContratacoesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListContratacoesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 50.0, 10.0, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      fillColor: Color(0x345A5151),
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.black,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/Captura_de_tela_2024-11-04_170238-removebg-preview.png',
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.0,
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        fillColor: Color(0x345A5151),
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.black,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Contratações',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: wrapWithModel(
                        model: _model.jarbasSearchBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: JarbasSearchBarWidget(
                          searchAction: () async {
                            await queryContratacoesRecordOnce()
                                .then(
                                  (records) => _model.simpleSearchResults =
                                      TextSearch(
                                    records
                                        .map(
                                          (record) => TextSearchItem.fromTerms(
                                              record, [
                                            record.nomeDaVaga,
                                            record.cidadeDaVaga,
                                            record.tipoDaVaga
                                          ]),
                                        )
                                        .toList(),
                                  )
                                          .search(_model.jarbasSearchBarModel
                                              .textController.text)
                                          .map((r) => r.object)
                                          .toList(),
                                )
                                .onError(
                                    (_, __) => _model.simpleSearchResults = [])
                                .whenComplete(() => safeSetState(() {}));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                if (_model.jarbasSearchBarModel.textController.text == '')
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: StreamBuilder<List<ContratacoesRecord>>(
                        stream: queryContratacoesRecord(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 40.0,
                                height: 40.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ContratacoesRecord>
                              vagasHomeOfficeContratacoesRecordList =
                              snapshot.data!;

                          return Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Builder(
                              builder: (context) {
                                final contratacaoItem =
                                    vagasHomeOfficeContratacoesRecordList
                                        .where((e) =>
                                            e.cidadeDaVaga ==
                                            FFAppState()
                                                .municipioSelected
                                                .municipioID)
                                        .toList();

                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    10.0,
                                    0,
                                    15.0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: contratacaoItem.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 15.0),
                                  itemBuilder: (context, contratacaoItemIndex) {
                                    final contratacaoItemItem =
                                        contratacaoItem[contratacaoItemIndex];
                                    return CardContratacaoWidget(
                                      key: Key(
                                          'Keykq6_${contratacaoItemIndex}_of_${contratacaoItem.length}'),
                                      objectDocument: contratacaoItemItem,
                                      cardAction: () async {
                                        context.pushNamed(
                                          'DetalhesVaga',
                                          queryParameters: {
                                            'contratacaoID': serializeParam(
                                              contratacaoItemItem.reference.id,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (_model.jarbasSearchBarModel.textController.text != '')
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Builder(
                          builder: (context) {
                            final contratacao =
                                _model.simpleSearchResults.toList();

                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                10.0,
                                0,
                                15.0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: contratacao.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 15.0),
                              itemBuilder: (context, contratacaoIndex) {
                                final contratacaoItem =
                                    contratacao[contratacaoIndex];
                                return CardContratacaoWidget(
                                  key: Key(
                                      'Key1a8_${contratacaoIndex}_of_${contratacao.length}'),
                                  objectDocument: contratacaoItem,
                                  cardAction: () async {
                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context.pushNamed(
                                      'DetalhesVaga',
                                      queryParameters: {
                                        'contratacaoID': serializeParam(
                                          contratacaoItem.contratacaoID,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
              ].divide(SizedBox(height: 15.0)),
            ),
          ),
        ),
      ),
    );
  }
}
