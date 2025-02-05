// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';

Future<int> getVideoDuration(String videoUrl) async {
  try {
    // Inicializa o controlador do vídeo
    final VideoPlayerController controller =
        VideoPlayerController.network(videoUrl);
    await controller.initialize();

    // Pega a duração do vídeo em milissegundos e converte para segundos
    final int durationInSeconds = controller.value.duration.inSeconds;

    // Libera os recursos do controlador
    await controller.dispose();

    return durationInSeconds;
  } catch (e) {
    // Em caso de erro, retorne 0 ou lidere de outra forma
    return 0;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
