import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'list_stories_model.dart';
export 'list_stories_model.dart';

class ListStoriesWidget extends StatefulWidget {
  const ListStoriesWidget({super.key});

  @override
  State<ListStoriesWidget> createState() => _ListStoriesWidgetState();
}

class _ListStoriesWidgetState extends State<ListStoriesWidget> {
  late ListStoriesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListStoriesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<StorysRecord>>(
      stream: queryStorysRecord(
        queryBuilder: (storysRecord) => storysRecord.where(
          'createdTime',
          isEqualTo: dateTimeFormat("dd/MM/yyyy", getCurrentTimestamp),
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
        List<StorysRecord> storyListStorysRecordList = snapshot.data!;

        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          decoration: BoxDecoration(
            color: Color(0x00FFFFFF),
          ),
          child: Visibility(
            visible: storyListStorysRecordList.length > 0,
            child: StreamBuilder<List<EmpresasRecord>>(
              stream: queryEmpresasRecord(
                queryBuilder: (empresasRecord) => empresasRecord.whereIn(
                    'empresaID',
                    storyListStorysRecordList.map((e) => e.empresaID).toList()),
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
                List<EmpresasRecord> storySecondQueryEmpresasRecordList =
                    snapshot.data!;

                return Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Acompanhe as novidades:',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.11,
                        decoration: BoxDecoration(
                          color: Color(0x00FFFFFF),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final story =
                                storySecondQueryEmpresasRecordList.toList();

                            return ListView.separated(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              scrollDirection: Axis.horizontal,
                              itemCount: story.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(width: 15.0),
                              itemBuilder: (context, storyIndex) {
                                final storyItem = story[storyIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'storyView',
                                      queryParameters: {
                                        'empresaID': serializeParam(
                                          storyItem.empresaID,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.15,
                                    height:
                                        MediaQuery.sizeOf(context).width * 0.15,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            if (storyItem.fotoUrl != '') {
                                              return Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.16,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.16,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.16,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.16,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        '${storyItem.fotoUrl}',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.16,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.11,
                                                      child: custom_widgets
                                                          .CircularStatusBorder(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.16,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.11,
                                                        totalPosts: storyListStorysRecordList
                                                            .where((e) =>
                                                                (e.empresaID ==
                                                                    storyItem
                                                                        .empresaID) &&
                                                                (e.createdTime ==
                                                                    dateTimeFormat(
                                                                        "dd/MM/yyyy",
                                                                        getCurrentTimestamp)))
                                                            .toList()
                                                            .length,
                                                        space: storyListStorysRecordList
                                                                    .where((e) =>
                                                                        (e.empresaID ==
                                                                            storyItem
                                                                                .empresaID) &&
                                                                        (e.createdTime ==
                                                                            dateTimeFormat("dd/MM/yyyy",
                                                                                getCurrentTimestamp)))
                                                                    .toList()
                                                                    .length ==
                                                                1
                                                            ? 1.0
                                                            : 0.96,
                                                        colorBorder:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.16,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.16,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x00FFFFFF),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Container(
                                                      width: 200.0,
                                                      height: 200.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/Captura_de_tela_2024-11-04_170238-removebg-preview.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.16,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.09,
                                                    child: custom_widgets
                                                        .CircularStatusBorder(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.16,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.09,
                                                      totalPosts: storyListStorysRecordList
                                                          .where((e) =>
                                                              (e.empresaID ==
                                                                  storyItem
                                                                      .empresaID) &&
                                                              (e.createdTime ==
                                                                  dateTimeFormat(
                                                                      "dd/MM/yyyy",
                                                                      getCurrentTimestamp)))
                                                          .toList()
                                                          .length,
                                                      space: storyListStorysRecordList
                                                                  .where((e) =>
                                                                      (e.empresaID ==
                                                                          storyItem
                                                                              .empresaID) &&
                                                                      (e.createdTime ==
                                                                          dateTimeFormat(
                                                                              "dd/MM/yyyy",
                                                                              getCurrentTimestamp)))
                                                                  .toList()
                                                                  .length ==
                                                              1
                                                          ? 1.0
                                                          : 0.96,
                                                      colorBorder:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }
                                          },
                                        ),
                                      ].divide(SizedBox(height: 10.0)),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
