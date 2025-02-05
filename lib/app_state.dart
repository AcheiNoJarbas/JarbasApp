import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_municipioSelected')) {
        try {
          final serializedData =
              prefs.getString('ff_municipioSelected') ?? '{}';
          _municipioSelected = MuncipioSelecionadoStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  MuncipioSelecionadoStruct _municipioSelected = MuncipioSelecionadoStruct();
  MuncipioSelecionadoStruct get municipioSelected => _municipioSelected;
  set municipioSelected(MuncipioSelecionadoStruct value) {
    _municipioSelected = value;
    prefs.setString('ff_municipioSelected', value.serialize());
  }

  void updateMunicipioSelectedStruct(
      Function(MuncipioSelecionadoStruct) updateFn) {
    updateFn(_municipioSelected);
    prefs.setString('ff_municipioSelected', _municipioSelected.serialize());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
