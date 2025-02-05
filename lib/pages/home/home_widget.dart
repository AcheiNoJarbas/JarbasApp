import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/golbal_components/buttons/jarbas_large_button/jarbas_large_button_widget.dart';
import '/golbal_components/cards/card_categoria/card_categoria_widget.dart';
import '/golbal_components/forms/jarbas_search_bar/jarbas_search_bar_widget.dart';
import '/golbal_components/list_stories/list_stories_widget.dart';
import '/golbal_components/nav_bar/nav_bar_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:text_search/text_search.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

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
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.08,
                  decoration: const BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.13,
                        height: MediaQuery.sizeOf(context).width * 0.13,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/Captura_de_tela_2024-11-04_170238-removebg-preview.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StreamBuilder<List<EmpresasRecord>>(
                          stream: queryEmpresasRecord(
                            queryBuilder: (empresasRecord) =>
                                empresasRecord.where(
                              'inDestaque',
                              isEqualTo: true,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 40.0,
                                  height: 40.0,
                                  child: SpinKitFadingCircle(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 40.0,
                                  ),
                                ),
                              );
                            }
                            List<EmpresasRecord>
                                divulgacaoContainerEmpresasRecordList =
                                snapshot.data!;

                            return Container(
                              decoration: const BoxDecoration(),
                              child: Visibility(
                                visible: divulgacaoContainerEmpresasRecordList.isNotEmpty,
                                child: Builder(
                                  builder: (context) {
                                    final itemDivul =
                                        divulgacaoContainerEmpresasRecordList
                                            .toList();

                                    return SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.232,
                                      child: CarouselSlider.builder(
                                        itemCount: itemDivul.length,
                                        itemBuilder:
                                            (context, itemDivulIndex, _) {
                                          final itemDivulItem =
                                              itemDivul[itemDivulIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'DetalhesEmpresa',
                                                queryParameters: {
                                                  'empresaID': serializeParam(
                                                    itemDivulItem.empresaID,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              decoration: const BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                              ),
                                              child: Stack(
                                                children: [
                                                  if (itemDivulItem.fotoUrl !=
                                                          '')
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          itemDivulItem
                                                                          .bannerUrl !=
                                                                      ''
                                                              ? valueOrDefault<
                                                                  String>(
                                                                  valueOrDefault<String>(
                                                                    itemDivulItem
                                                                        .fotoUrl,
                                                                    'https://static.vecteezy.com/system/resources/previews/000/664/483/original/abstract-blue-banner-design-vector.jpg',
                                                                  ),
                                                                  'https://static.vecteezy.com/system/resources/previews/000/664/483/original/abstract-blue-banner-design-vector.jpg',
                                                                )
                                                              : valueOrDefault<String>(
                                                                  itemDivulItem
                                                                      .bannerUrl,
                                                                  'https://static.vecteezy.com/system/resources/previews/000/664/483/original/abstract-blue-banner-design-vector.jpg',
                                                                ),
                                                          'https://static.vecteezy.com/system/resources/previews/000/664/483/original/abstract-blue-banner-design-vector.jpg',
                                                        ),
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                1.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -0.97, 0.93),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      decoration: const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0.0),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            5.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.15,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.15,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/grg.png',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        carouselController:
                                            _model.divulgacaoController ??=
                                                CarouselSliderController(),
                                        options: CarouselOptions(
                                          initialPage: max(
                                              0, min(1, itemDivul.length - 1)),
                                          viewportFraction: 0.85,
                                          disableCenter: true,
                                          enlargeCenterPage: true,
                                          enlargeFactor: 0.25,
                                          enableInfiniteScroll: true,
                                          scrollDirection: Axis.horizontal,
                                          autoPlay: true,
                                          autoPlayAnimationDuration:
                                              const Duration(milliseconds: 800),
                                          autoPlayInterval: const Duration(
                                              milliseconds: (800 + 5000)),
                                          autoPlayCurve: Curves.linear,
                                          pauseAutoPlayInFiniteScroll: true,
                                          onPageChanged: (index, _) => _model
                                              .divulgacaoCurrentIndex = index,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        wrapWithModel(
                          model: _model.listStoriesModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const ListStoriesWidget(),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: wrapWithModel(
                            model: _model.jarbasLargeButtonModel,
                            updateCallback: () => safeSetState(() {}),
                            child: JarbasLargeButtonWidget(
                              textButton: 'CONTRATAÇÕES',
                              buttonAction: () async {
                                context.pushNamed('listContratacoes');
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  offset: const Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 20.0, 10.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Busque empresas por categoria:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  wrapWithModel(
                                    model: _model.jarbasSearchBarModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: JarbasSearchBarWidget(
                                      searchAction: () async {
                                        await queryCategoriasRecordOnce()
                                            .then(
                                              (records) => _model
                                                      .simpleSearchResults =
                                                  TextSearch(
                                                records
                                                    .map(
                                                      (record) => TextSearchItem
                                                          .fromTerms(record,
                                                              [record.nome]),
                                                    )
                                                    .toList(),
                                              )
                                                      .search(_model
                                                          .jarbasSearchBarModel
                                                          .textController
                                                          .text)
                                                      .map((r) => r.object)
                                                      .toList(),
                                            )
                                            .onError((_, __) =>
                                                _model.simpleSearchResults = [])
                                            .whenComplete(
                                                () => safeSetState(() {}));
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        if (_model.jarbasSearchBarModel
                                                    .textController.text !=
                                                '') {
                                          return Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                final categoria = _model
                                                    .simpleSearchResults
                                                    .toList();

                                                return GridView.builder(
                                                  padding: const EdgeInsets.fromLTRB(
                                                    0,
                                                    0,
                                                    0,
                                                    15.0,
                                                  ),
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 10.0,
                                                    mainAxisSpacing: 10.0,
                                                    childAspectRatio: 1.0,
                                                  ),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: categoria.length,
                                                  itemBuilder: (context,
                                                      categoriaIndex) {
                                                    final categoriaItem =
                                                        categoria[
                                                            categoriaIndex];
                                                    return CardCategoriaWidget(
                                                      key: Key(
                                                          'Key8uy_${categoriaIndex}_of_${categoria.length}'),
                                                      objectDocument:
                                                          categoriaItem,
                                                      cardFunction: () async {
                                                        context.pushNamed(
                                                          'ListLocalidades',
                                                          queryParameters: {
                                                            'categoria':
                                                                serializeParam(
                                                              categoriaItem
                                                                  .nome,
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
                                        } else {
                                          return Visibility(
                                            visible: _model.jarbasSearchBarModel
                                                        .textController.text ==
                                                    '',
                                            child: StreamBuilder<
                                                List<CategoriasRecord>>(
                                              stream: queryCategoriasRecord(),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      child:
                                                          SpinKitFadingCircle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 40.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<CategoriasRecord>
                                                    containerCategoriasRecordList =
                                                    snapshot.data!;

                                                return Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final categoria =
                                                          containerCategoriasRecordList
                                                              .toList();

                                                      return GridView.builder(
                                                        padding:
                                                            const EdgeInsets.fromLTRB(
                                                          0,
                                                          0,
                                                          0,
                                                          15.0,
                                                        ),
                                                        gridDelegate:
                                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 3,
                                                          crossAxisSpacing:
                                                              10.0,
                                                          mainAxisSpacing: 10.0,
                                                          childAspectRatio: 1.0,
                                                        ),
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            categoria.length,
                                                        itemBuilder: (context,
                                                            categoriaIndex) {
                                                          final categoriaItem =
                                                              categoria[
                                                                  categoriaIndex];
                                                          return CardCategoriaWidget(
                                                            key: Key(
                                                                'Keyrpl_${categoriaIndex}_of_${categoria.length}'),
                                                            objectDocument:
                                                                categoriaItem,
                                                            cardFunction:
                                                                () async {
                                                              context.pushNamed(
                                                                'ListLocalidades',
                                                                queryParameters:
                                                                    {
                                                                  'categoria':
                                                                      serializeParam(
                                                                    categoriaItem
                                                                        .nome,
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
                                                );
                                              },
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 15.0)),
                              ),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 10.0)),
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const NavBarWidget(
                    tela: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
