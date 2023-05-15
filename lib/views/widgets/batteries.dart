import 'package:flutter/material.dart';
import 'package:speedo_ev/views/screens/dash_line_painter/dash_line_painter.dart';
import 'package:speedo_ev/views/screens/dashboard/widgets/gear_printer.dart';
import 'package:speedo_ev/views/widgets/gears.dart';

class Batteries extends StatelessWidget {
  const Batteries({Key? key, required this.constraints}) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      // color: Colors.blueGrey.withOpacity(0.15),
      width: constraints.maxWidth * 0.74,
      height: constraints.maxHeight * 0.22,
      child: LayoutBuilder(
        builder: (context, gearConstraints) => Stack(
          fit: StackFit.expand,
          children: [
            CustomPaint(
              painter: GearPrinter(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Gears(),
                  Text.rich(
                    TextSpan(
                      text: "RANGE ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.16),
                      ),
                      children: const [
                        TextSpan(
                          text: " 450 KM",
                          style: TextStyle(
                            color: Color(0xFFA5B2FF),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      width: gearConstraints.maxWidth * 0.72,
                      child: Row(
                        children: [
                          Text(
                            "E",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.16),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              height: 8,
                              child: ClipPath(
                                clipper: BatteryStatus(),
                                child: CustomPaint(
                                  painter: DashLinePainter(progress: 1),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "100%",
                              style: TextStyle(
                                color: Color(0xFF77C000),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: gearConstraints.maxHeight * 0.10,
              left: gearConstraints.maxWidth * 0.16,
              width: gearConstraints.maxWidth * 0.17,
              height: gearConstraints.maxHeight * 0.38,
              child: CustomPaint(
                painter: AvgKmPrinter(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: gearConstraints.maxWidth * 0.025),
                    Text(
                      "AVG ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.16),
                      ),
                    ),
                    Text(
                      "12.3 W/KM",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.32),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: gearConstraints.maxHeight * 0.10,
              right: gearConstraints.maxWidth * 0.16,
              width: gearConstraints.maxWidth * 0.17,
              height: gearConstraints.maxHeight * 0.38,
              child: CustomPaint(
                painter: OdoPrinter(),
                child: Row(
                  children: [
                    Text(
                      "TRIP A ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.16),
                      ),
                    ),
                    Text(
                      "215.3 KM",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.32),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BatteryStatus extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width * 0.05, 0)
      ..lineTo(size.width * 0.95, 0)
      ..lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class AvgKmPrinter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF1F51FF)
      ..style = PaintingStyle.fill;

    const double strokeWidth = 4;
    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width * 0.27, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width * 0.27, strokeWidth);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OdoPrinter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF1F51FF)
      ..style = PaintingStyle.fill;

    const double strokeWidth = 4;
    Path path = Path()
      ..lineTo(size.width * 0.73, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * 0.73, strokeWidth);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
