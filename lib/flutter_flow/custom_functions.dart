import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

String removerCaracters(String remove) {
  return remove.replaceAll(RegExp(r'[^0-9]'), '');
}

String formatToPhoneNumber(String input) {
  String cleanedInput = input.replaceAll(RegExp(r'[^0-9]'), '');

  // Garante que não estamos tentando formatar um número vazio
  if (cleanedInput.isEmpty) {
    return "";
  }

  // Limita o número de dígitos a 13 (exemplo: +55 (11) 9 1234-5678)
  cleanedInput =
      cleanedInput.length > 13 ? cleanedInput.substring(0, 13) : cleanedInput;

  // Aplica a máscara
  String formatted = "+";
  if (cleanedInput.length > 0)
    formatted += cleanedInput.substring(0, 2); // Código do país
  if (cleanedInput.length > 2)
    formatted += " (" + cleanedInput.substring(2, 4) + ")"; // DDD
  if (cleanedInput.length > 4)
    formatted +=
        " " + cleanedInput.substring(4, 5); // Primeiro dígito do número
  if (cleanedInput.length > 5)
    formatted += " " + cleanedInput.substring(5, 9); // Meio do número
  if (cleanedInput.length > 9)
    formatted += "-" + cleanedInput.substring(9); // Final do número

  return formatted;
}
