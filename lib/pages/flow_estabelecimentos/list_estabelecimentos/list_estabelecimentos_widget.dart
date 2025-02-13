import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/golbal_components/cards/card_empresa/card_empresa_widget.dart';
import '/golbal_components/forms/jarbas_search_bar/jarbas_search_bar_widget.dart';
import '/golbal_components/forms/lista_vazia/lista_vazia_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'list_estabelecimentos_model.dart';
export 'list_estabelecimentos_model.dart';

class ListEstabelecimentosWidget extends StatefulWidget {
  const ListEstabelecimentosWidget({
    super.key,
    required this.categoria,
    required this.bairro,
  });

  final String? categoria;
  final String? bairro;

  @override
  State<ListEstabelecimentosWidget> createState() =>
      _ListEstabelecimentosWidgetState();
}

class _ListEstabelecimentosWidgetState
    extends State<ListEstabelecimentosWidget> {
  late ListEstabelecimentosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListEstabelecimentosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.resultOfListEmpresas = await queryEmpresasRecordOnce();
      _model.bairroSelected = await queryBairrosRecordOnce(
        queryBuilder: (bairrosRecord) => bairrosRecord.where(
          'bairroID',
          isEqualTo: widget.bairro,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
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
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 30.0),
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
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Estabelecimentos',
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
                              ),
                            ),
                            Text(
                              'Selecione ou pesquise por um estabelecimento localizado em ${_model.bairroSelected?.nome}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            wrapWithModel(
                              model: _model.jarbasSearchBarModel,
                              updateCallback: () => safeSetState(() {}),
                              child: JarbasSearchBarWidget(
                                searchAction: () async {
                                  await queryEmpresasRecordOnce()
                                      .then(
                                        (records) => _model
                                            .simpleSearchResults = TextSearch(
                                          records
                                              .map(
                                                (record) =>
                                                    TextSearchItem.fromTerms(
                                                        record, [record.nome]),
                                              )
                                              .toList(),
                                        )
                                            .search(_model.jarbasSearchBarModel
                                                .textController.text)
                                            .map((r) => r.object)
                                            .toList(),
                                      )
                                      .onError((_, __) =>
                                          _model.simpleSearchResults = [])
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
                                        if (_model.jarbasSearchBarModel
                                                    .textController.text ==
                                                '')
                                          Expanded(
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  final empresa = _model
                                                          .resultOfListEmpresas
                                                          ?.where((e) =>
                                                              e.bairros
                                                                  .contains(widget
                                                                      .bairro) &&
                                                              e.categorias
                                                                  .contains(widget
                                                                      .categoria) &&
                                                              e.municipios.contains(
                                                                  FFAppState()
                                                                      .municipioSelected
                                                                      .municipioID))
                                                          .toList()
                                                          .toList() ??
                                                      [];
                                                  if (empresa.isEmpty) {
                                                    return ListaVaziaWidget();
                                                  }

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: empresa.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 15.0),
                                                    itemBuilder: (context,
                                                        empresaIndex) {
                                                      final empresaItem =
                                                          empresa[empresaIndex];
                                                      return CardEmpresaWidget(
                                                        key: Key(
                                                            'Keyh4o_${empresaIndex}_of_${empresa.length}'),
                                                        objectDocument:
                                                            empresaItem,
                                                        cardFunction: () async {
                                                          context.pushNamed(
                                                            'DetalhesEmpresa',
                                                            queryParameters: {
                                                              'empresaID':
                                                                  serializeParam(
                                                                empresaItem
                                                                    .reference
                                                                    .id,
                                                                ParamType
                                                                    .String,
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
                                        if (_model.jarbasSearchBarModel
                                                    .textController.text !=
                                                '')
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                final empresa = _model
                                                    .simpleSearchResults
                                                    .where((e) =>
                                                        e.bairros.contains(
                                                            widget.bairro) &&
                                                        e.categorias.contains(
                                                            widget
                                                                .categoria) &&
                                                        e.municipios.contains(
                                                            FFAppState()
                                                                .municipioSelected
                                                                .municipioID))
                                                    .toList();

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: empresa.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 15.0),
                                                  itemBuilder:
                                                      (context, empresaIndex) {
                                                    final empresaItem =
                                                        empresa[empresaIndex];
                                                    return CardEmpresaWidget(
                                                      key: Key(
                                                          'Key7e5_${empresaIndex}_of_${empresa.length}'),
                                                      objectDocument:
                                                          empresaItem,
                                                      cardFunction: () async {
                                                        context.pushNamed(
                                                          'DetalhesEmpresa',
                                                          queryParameters: {
                                                            'empresaID':
                                                                serializeParam(
                                                              empresaItem
                                                                  .reference.id,
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
                                      ],
                                    );
                                  } else {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.15,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.075,
                                              child:
                                                  custom_widgets.JarbasLoading(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.15,
                                                height:
                                                    MediaQuery.sizeOf(context)
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
