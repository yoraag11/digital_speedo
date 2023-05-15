import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color primaryColor = Color(0xFF1F51FF);

String formatJam(String tanggal) {
  if (tanggal != "") {
    DateTime dt = DateTime.parse(tanggal);
    String jam = DateFormat('HH:mm').format(dt);

    return jam;
  } else {
    return '- : -';
  }
}
