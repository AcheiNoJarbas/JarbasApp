import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/golbal_components/forms/jarbas_search_bar/jarbas_search_bar_widget.dart';
import '/index.dart';
import 'list_categoria_to_estabelecimentos_widget.dart'
    show ListCategoriaToEstabelecimentosWidget;
import 'package:flutter/material.dart';

class ListCategoriaToEstabelecimentosModel
    extends FlutterFlowModel<ListCategoriaToEstabelecimentosWidget> {
  ///  Local state fields for this page.

  String? categoriaSelecionada = 'Artesanato';

  ///  State fields for stateful widgets in this page.

  // Model for JarbasSearchBar component.
  late JarbasSearchBarModel jarbasSearchBarModel;
  List<CategoriasRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    jarbasSearchBarModel = createModel(context, () => JarbasSearchBarModel());
  }

  @override
  void dispose() {
    jarbasSearchBarModel.dispose();
  }
}
