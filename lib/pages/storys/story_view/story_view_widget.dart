import '/backend/backend.dart';
import '/components/jarbas_carrousel_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'story_view_model.dart';
export 'story_view_model.dart';

class StoryViewWidget extends StatefulWidget {
  const StoryViewWidget({
    super.key,
    required this.empresaID,
  });

  final String? empresaID;

  @override
  State<StoryViewWidget> createState() => _StoryViewWidgetState();
}

class _StoryViewWidgetState extends State<StoryViewWidget> {
  late StoryViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoryViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.storysByEmpresaID = await queryStorysRecordOnce(
        queryBuilder: (storysRecord) => storysRecord
            .where(
              'empresaID',
              isEqualTo: widget.empresaID,
            )
            .where(
              'createdTime',
              isEqualTo: dateTimeFormat("dd/MM/yyyy", getCurrentTimestamp),
            ),
      );
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: const BoxDecoration(
            color: Color(0x00FFFFFF),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 100.0,
                      fillColor: const Color(0x3AFFFFFF),
                      icon: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).info,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                    Expanded(
                      child: StreamBuilder<List<EmpresasRecord>>(
                        stream: queryEmpresasRecord(
                          queryBuilder: (empresasRecord) =>
                              empresasRecord.where(
                            'empresaID',
                            isEqualTo: widget.empresaID,
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
                          List<EmpresasRecord> containerEmpresasRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final containerEmpresasRecord =
                              containerEmpresasRecordList.isNotEmpty
                                  ? containerEmpresasRecordList.first
                                  : null;

                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (Navigator.of(context).canPop()) {
                                context.pop();
                              }
                              context.pushNamed(
                                'DetalhesEmpresa',
                                queryParameters: {
                                  'empresaID': serializeParam(
                                    widget.empresaID,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0x00FFFFFF),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (containerEmpresasRecord?.fotoUrl !=
                                                null &&
                                            containerEmpresasRecord?.fotoUrl !=
                                                '') {
                                          return Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.14,
                                            height: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.14,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              '${containerEmpresasRecord?.fotoUrl}',
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.14,
                                            height: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.14,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/Captura_de_tela_2024-11-04_170238-removebg-preview.png',
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            containerEmpresasRecord?.nome,
                                            'Nome da empresa',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ].divide(const SizedBox(width: 10.0)),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ]
                      .divide(const SizedBox(width: 10.0))
                      .addToStart(const SizedBox(width: 10.0))
                      .addToEnd(const SizedBox(width: 10.0)),
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (_model.reload) {
                      return Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: const BoxDecoration(
                          color: Color(0x00FFFFFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                final storieCount =
                                    _model.storysByEmpresaID?.toList() ?? [];

                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(storieCount.length,
                                          (storieCountIndex) {
                                    final storieCountItem =
                                        storieCount[storieCountIndex];
                                    return Expanded(
                                      child: Container(
                                        width: valueOrDefault<double>(
                                          (MediaQuery.sizeOf(context).width /
                                                  _model
                                                      .storysByEmpresaID!.length
                                                      .toDouble()) -
                                              2,
                                          100.0,
                                        ),
                                        height: 5.0,
                                        decoration: BoxDecoration(
                                          color: storieCountItem.storyID ==
                                                  _model.storysByEmpresaID
                                                      ?.elementAtOrNull(_model
                                                          .jarbasCarrouselModel
                                                          .currentPage)
                                                      ?.storyID
                                              ? Colors.white
                                              : const Color(0x00FFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: const Color(0xD7FFFFFF),
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                                      .divide(const SizedBox(width: 2.0))
                                      .addToStart(const SizedBox(width: 2.0))
                                      .addToEnd(const SizedBox(width: 2.0)),
                                );
                              },
                            ),
                            Expanded(
                              child: wrapWithModel(
                                model: _model.jarbasCarrouselModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: JarbasCarrouselWidget(
                                  story: _model.storysByEmpresaID!,
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 2.0)),
                        ),
                      );
                    } else {
                      return Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: const BoxDecoration(
                          color: Color(0x00FFFFFF),
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.15,
                          height: MediaQuery.sizeOf(context).height * 0.07,
                          child: custom_widgets.JarbasLoading(
                            width: MediaQuery.sizeOf(context).width * 0.15,
                            height: MediaQuery.sizeOf(context).height * 0.07,
                            colorIndicator: const Color(0xFF003CFF),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ].divide(const SizedBox(height: 5.0)),
          ),
        ),
      ),
    );
  }
}
