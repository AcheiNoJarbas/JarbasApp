// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class JarbasLoading extends StatefulWidget {
  const JarbasLoading({
    super.key,
    this.width,
    this.height,
    this.colorIndicator,
  });

  final double? width;
  final double? height;
  final Color? colorIndicator;

  @override
  State<JarbasLoading> createState() => _JarbasLoadingState();
}

class _JarbasLoadingState extends State<JarbasLoading> {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color:
          widget.colorIndicator != null ? widget.colorIndicator! : Colors.blue,
    );
  }
}
