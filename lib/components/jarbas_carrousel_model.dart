import '/flutter_flow/flutter_flow_util.dart';
import 'jarbas_carrousel_widget.dart' show JarbasCarrouselWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class JarbasCarrouselModel extends FlutterFlowModel<JarbasCarrouselWidget> {
  ///  Local state fields for this component.

  int currentDuration = 5000;

  int currentPage = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getVideoDuration] action in JarbasCarrousel widget.
  int? durationFrist;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  // Stores action output result for [Custom Action - getVideoDuration] action in Carousel widget.
  int? duration;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
