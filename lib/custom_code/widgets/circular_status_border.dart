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

import 'dart:math';

class CircularStatusBorder extends StatefulWidget {
  const CircularStatusBorder(
      {super.key,
      this.width,
      this.height,
      required this.totalPosts,
      required this.space,
      this.colorBorder});

  final double? width;
  final double? height;
  final int totalPosts;
  final double space;
  final Color? colorBorder;
  @override
  State<CircularStatusBorder> createState() => _CircularStatusBorderState();
}

class _CircularStatusBorderState extends State<CircularStatusBorder> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(widget.width!, widget.height!), // Tamanho da borda
      painter: StatusBorderPainter(widget.totalPosts, widget.space,
          colorSegment:
              widget.colorBorder), // Passando 'totalPosts' para o Painter
    );
  }
}

class StatusBorderPainter extends CustomPainter {
  final int totalPosts;
  final double spaceAngle; // Variável renomeada para 'totalPosts'
  final Color? colorSegment;
  StatusBorderPainter(this.totalPosts, this.spaceAngle, {this.colorSegment});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke // Apenas o contorno
      ..strokeWidth = 3 // Largura da borda
      ..color = colorSegment != null
          ? colorSegment as Color
          : Colors.blue as Color; // Cor da borda

    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);

    final segmentAngle =
        2 * pi / totalPosts; // Calculando o ângulo com base no número de posts
    for (int i = 0; i < totalPosts; i++) {
      final startAngle = i * segmentAngle;
      final sweepAngle = segmentAngle * spaceAngle; // Espaço entre os segmentos

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
