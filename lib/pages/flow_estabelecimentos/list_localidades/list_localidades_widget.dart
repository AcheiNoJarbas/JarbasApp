import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/golbal_components/cards/card_bairro/card_bairro_widget.dart';
import '/golbal_components/forms/jarbas_search_bar/jarbas_search_bar_widget.dart';
import '/golbal_components/forms/lista_vazia/lista_vazia_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'list_localidades_model.dart';
export 'list_localidades_model.dart';

class ListLocalidadesWidget extends StatefulWidget {
  const ListLocalidadesWidget({
    super.key,
    String? categoria,
  }) : this.categoria = categoria ?? 'Normal';

  final String categoria;

  static String routeName = 'ListLocalidades';
  static String routePath = '/listLocalidades';

  @override
  State<ListLocalidadesWidget> createState() => _ListLocalidadesWidgetState();
}

class _ListLocalidadesWidgetState extends State<ListLocalidadesWidget> {
  late ListLocalidadesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListLocalidadesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.resultOfRequestBairros = await queryBairrosRecordOnce();
      _model.reload = true;
      safeSetState(() {});
    });

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(115.0, 0.0, 0.0, 0.0),
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
                ],
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: StreamBuilder<List<MunicipiosRecord>>(
                          stream: queryMunicipiosRecord(
                            queryBuilder: (municipiosRecord) =>
                                municipiosRecord.where(
                              'municipioID',
                              isEqualTo:
                                  FFAppState().municipioSelected.municipioID,
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<MunicipiosRecord>
                                richTextMunicipiosRecordList = snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final richTextMunicipiosRecord =
                                richTextMunicipiosRecordList.isNotEmpty
                                    ? richTextMunicipiosRecordList.first
                                    : null;

                            return RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Bairros em ${valueOrDefault<String>(
                                      richTextMunicipiosRecord?.nome,
                                      'Name',
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              textAlign: TextAlign.start,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Text(
                          'Selecione ou pesquise por um bairro para ver os estabelecimentos cadastrados',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.jarbasSearchBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: JarbasSearchBarWidget(
                          searchAction: () async {
                            await queryBairrosRecordOnce()
                                .then(
                                  (records) => _model.simpleSearchResults =
                                      TextSearch(
                                    records
                                        .map(
                                          (record) => TextSearchItem.fromTerms(
                                              record, [
                                            record.nome,
                                            record.stateCode,
                                            record.municipio
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
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            if (_model.reload) {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.jarbasSearchBarModel.textController
                                              .text ==
                                          '')
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            final bairro = _model
                                                    .resultOfRequestBairros
                                                    ?.where((e) =>
                                                        (e.nome ==
                                                            FFAppState()
                                                                .municipioSelected
                                                                .nome) ||
                                                        (e.municipioID ==
                                                            FFAppState()
                                                                .municipioSelected
                                                                .municipioID))
                                                    .toList()
                                                    .toList() ??
                                                [];
                                            if (bairro.isEmpty) {
                                              return ListaVaziaWidget();
                                            }

                                            return ListView.separated(
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                10.0,
                                                0,
                                                10.0,
                                              ),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: bairro.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 15.0),
                                              itemBuilder:
                                                  (context, bairroIndex) {
                                                final bairroItem =
                                                    bairro[bairroIndex];
                                                return CardBairroWidget(
                                                  key: Key(
                                                      'Keyi4l_${bairroIndex}_of_${bairro.length}'),
                                                  objectBairro: bairroItem,
                                                  cardFunction: () async {
                                                    context.pushNamed(
                                                      ListEstabelecimentosWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'categoria':
                                                            serializeParam(
                                                          widget.categoria,
                                                          ParamType.String,
                                                        ),
                                                        'bairro':
                                                            serializeParam(
                                                          bairroItem.bairroID,
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
                                  if (_model.jarbasSearchBarModel.textController
                                              .text !=
                                          '')
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            final bairro = _model
                                                .simpleSearchResults
                                                .where((e) =>
                                                    (e.nome ==
                                                        FFAppState()
                                                            .municipioSelected
                                                            .nome) ||
                                                    (e.municipioID ==
                                                        FFAppState()
                                                            .municipioSelected
                                                            .municipioID))
                                                .toList();

                                            return ListView.separated(
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                10.0,
                                                0,
                                                10.0,
                                              ),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: bairro.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 10.0),
                                              itemBuilder:
                                                  (context, bairroIndex) {
                                                final bairroItem =
                                                    bairro[bairroIndex];
                                                return CardBairroWidget(
                                                  key: Key(
                                                      'Key9a5_${bairroIndex}_of_${bairro.length}'),
                                                  objectBairro: bairroItem,
                                                  cardFunction: () async {
                                                    context.pushNamed(
                                                      ListEstabelecimentosWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'categoria':
                                                            serializeParam(
                                                          widget.categoria,
                                                          ParamType.String,
                                                        ),
                                                        'bairro':
                                                            serializeParam(
                                                          bairroItem.bairroID,
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
                                ],
                              );
                            } else {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.15,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.075,
                                        child: custom_widgets.JarbasLoading(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.15,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.075,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
