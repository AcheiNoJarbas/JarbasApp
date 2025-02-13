import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/golbal_components/buttons/liked_button/liked_button_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'jarbas_carrousel_model.dart';
export 'jarbas_carrousel_model.dart';

class JarbasCarrouselWidget extends StatefulWidget {
  const JarbasCarrouselWidget({
    super.key,
    required this.story,
  });

  final List<StorysRecord>? story;

  @override
  State<JarbasCarrouselWidget> createState() => _JarbasCarrouselWidgetState();
}

class _JarbasCarrouselWidgetState extends State<JarbasCarrouselWidget> {
  late JarbasCarrouselModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JarbasCarrouselModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!widget.story!
          .elementAtOrNull(_model.carouselCurrentIndex)!
          .isImage) {
        _model.durationFrist = await actions.getVideoDuration(
          widget.story!.firstOrNull!.videoUrl,
        );
        _model.currentDuration = (_model.durationFrist!) * 1000;
        safeSetState(() {});
      }
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
    return Builder(
      builder: (context) {
        final storyItem = widget.story!.toList();

        return Container(
          width: double.infinity,
          height: 200.0,
          child: CarouselSlider.builder(
            itemCount: storyItem.length,
            itemBuilder: (context, storyItemIndex, _) {
              final storyItemItem = storyItem[storyItemIndex];
              return Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            if (storyItemItem.isImage) {
                              return Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    '${storyItemItem.imageUrl}',
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            } else {
                              return Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: custom_widgets.JarbasVideoPlayer(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  urlVideo: storyItemItem.videoUrl,
                                  colorLoading:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            LikedButtonWidget(
                              key: Key(
                                  'Keyapa_${storyItemIndex}_of_${storyItem.length}'),
                              stateLike: storyItemItem.clickedLike
                                  .contains(currentUserUid),
                              likeYes: () async {
                                await storyItemItem.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'clickedLike': FieldValue.arrayRemove(
                                          [currentUserUid]),
                                    },
                                  ),
                                });
                              },
                              likeNo: () async {
                                await storyItemItem.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'clickedLike': FieldValue.arrayUnion(
                                          [currentUserUid]),
                                    },
                                  ),
                                });
                              },
                            ),
                          ].addToEnd(SizedBox(width: 15.0)),
                        ),
                      ),
                      if (storyItemItem.descricao != '')
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0x9B000000),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              valueOrDefault<String>(
                                storyItemItem.descricao,
                                'Descrição',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              );
            },
            carouselController: _model.carouselController ??=
                CarouselSliderController(),
            options: CarouselOptions(
              initialPage: max(0, min(0, storyItem.length - 1)),
              viewportFraction: 1.0,
              disableCenter: true,
              enlargeCenterPage: true,
              enlargeFactor: 0.25,
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayInterval: Duration(
                  milliseconds: (800 +
                      valueOrDefault<int>(
                        _model.currentDuration,
                        4000,
                      ))),
              autoPlayCurve: Curves.linear,
              pauseAutoPlayInFiniteScroll: true,
              onPageChanged: (index, _) async {
                _model.carouselCurrentIndex = index;
                if (!storyItem
                    .elementAtOrNull(_model.carouselCurrentIndex)!
                    .isImage) {
                  _model.duration = await actions.getVideoDuration(
                    storyItem
                        .elementAtOrNull(_model.carouselCurrentIndex)!
                        .videoUrl,
                  );
                  _model.currentDuration = (_model.duration!) * 1000;
                  _model.currentPage = _model.carouselCurrentIndex;
                  _model.updatePage(() {});
                }

                safeSetState(() {});
              },
            ),
          ),
        );
      },
    );
  }
}
