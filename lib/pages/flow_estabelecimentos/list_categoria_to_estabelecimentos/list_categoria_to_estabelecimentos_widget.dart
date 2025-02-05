import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/golbal_components/cards/card_categoria/card_categoria_widget.dart';
import '/golbal_components/forms/jarbas_search_bar/jarbas_search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:text_search/text_search.dart';
import 'list_categoria_to_estabelecimentos_model.dart';
export 'list_categoria_to_estabelecimentos_model.dart';

class ListCategoriaToEstabelecimentosWidget extends StatefulWidget {
  const ListCategoriaToEstabelecimentosWidget({super.key});

  @override
  State<ListCategoriaToEstabelecimentosWidget> createState() =>
      _ListCategoriaToEstabelecimentosWidgetState();
}

class _ListCategoriaToEstabelecimentosWidgetState
    extends State<ListCategoriaToEstabelecimentosWidget> {
  late ListCategoriaToEstabelecimentosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListCategoriaToEstabelecimentosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        endDrawer: Drawer(
          elevation: 16.0,
          child: Text(
            'Hello World',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
        ),
        body: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 1.0),
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Captura_de_tela_2024-11-05_213948.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            fillColor: const Color(0x345A5151),
                            icon: const Icon(
                              Icons.arrow_back_sharp,
                              color: Colors.black,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              context.safePop();
                            },
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                115.0, 0.0, 0.0, 0.0),
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
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Todas as categorias',
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
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.jarbasSearchBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: JarbasSearchBarWidget(
                          searchAction: () async {
                            await queryCategoriasRecordOnce()
                                .then(
                                  (records) => _model.simpleSearchResults =
                                      TextSearch(
                                    records
                                        .map(
                                          (record) => TextSearchItem.fromTerms(
                                              record, [record.nome]),
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
                      if (_model.jarbasSearchBarModel.textController.text == '')
                        Expanded(
                          child: StreamBuilder<List<CategoriasRecord>>(
                            stream: queryCategoriasRecord(),
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
                              List<CategoriasRecord>
                                  gridViewTodasCategoriasRecordList =
                                  snapshot.data!;

                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 1.0,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    gridViewTodasCategoriasRecordList.length,
                                itemBuilder: (context, gridViewTodasIndex) {
                                  final gridViewTodasCategoriasRecord =
                                      gridViewTodasCategoriasRecordList[
                                          gridViewTodasIndex];
                                  return CardCategoriaWidget(
                                    key: Key(
                                        'Keyv3o_${gridViewTodasIndex}_of_${gridViewTodasCategoriasRecordList.length}'),
                                    objectDocument:
                                        gridViewTodasCategoriasRecord,
                                    cardFunction: () async {
                                      context.pushNamed(
                                        'ListLocalidades',
                                        queryParameters: {
                                          'categoria': serializeParam(
                                            gridViewTodasCategoriasRecord.nome,
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
                      if (_model.jarbasSearchBarModel.textController.text != '')
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final pesquisa =
                                  _model.simpleSearchResults.toList();

                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 1.0,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: pesquisa.length,
                                itemBuilder: (context, pesquisaIndex) {
                                  final pesquisaItem = pesquisa[pesquisaIndex];
                                  return CardCategoriaWidget(
                                    key: Key(
                                        'Keykb9_${pesquisaIndex}_of_${pesquisa.length}'),
                                    objectDocument: pesquisaItem,
                                    cardFunction: () async {
                                      context.pushNamed(
                                        'ListLocalidades',
                                        queryParameters: {
                                          'categoria': serializeParam(
                                            pesquisaItem.nome,
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
                    ].divide(const SizedBox(height: 15.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
