import 'package:flutter/material.dart';

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFDD2100),
          Color(0xFFFF4500),
        ],
      ).createShader(const Offset(0, 0) & size)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0;

    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width * 0.13, size.height * 0.05);
    path.lineTo(size.width * 0.31, 0);
    path.lineTo(size.width * 0.39, size.height * 0.11);
    path.lineTo(size.width * 0.60, size.height * 0.11);
    path.lineTo(size.width * 0.69, 0);
    path.lineTo(size.width * 0.87, size.height * 0.05);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width * 0.87, size.height);
    path.lineTo(size.width * 0.13, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
