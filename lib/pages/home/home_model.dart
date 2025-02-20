import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/golbal_components/buttons/jarbas_large_button/jarbas_large_button_widget.dart';
import '/golbal_components/forms/jarbas_search_bar/jarbas_search_bar_widget.dart';
import '/golbal_components/list_stories/list_stories_widget.dart';
import '/golbal_components/nav_bar/nav_bar_widget.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Divulgacao widget.
  CarouselSliderController? divulgacaoController;
  int divulgacaoCurrentIndex = 1;

  // Model for listStories component.
  late ListStoriesModel listStoriesModel;
  // Model for JarbasLargeButton component.
  late JarbasLargeButtonModel jarbasLargeButtonModel;
  // Model for JarbasSearchBar component.
  late JarbasSearchBarModel jarbasSearchBarModel;
  List<CategoriasRecord> simpleSearchResults = [];
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    listStoriesModel = createModel(context, () => ListStoriesModel());
    jarbasLargeButtonModel =
        createModel(context, () => JarbasLargeButtonModel());
    jarbasSearchBarModel = createModel(context, () => JarbasSearchBarModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    listStoriesModel.dispose();
    jarbasLargeButtonModel.dispose();
    jarbasSearchBarModel.dispose();
    navBarModel.dispose();
  }
}
