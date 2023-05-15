import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speedo_ev/views/screens/path_painter/path_painter.dart';
import 'package:speedo_ev/views/screens/speed_line_painter/speed_line_painter.dart';
import 'package:speedo_ev/views/widgets/batteries.dart';
import 'package:speedo_ev/views/widgets/indicators.dart';
import 'package:speedo_ev/views/widgets/speeds.dart';
import 'package:speedo_ev/views/widgets/temperatures.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<double> speedLineOpacities = [1, 0.8, 0.6, 0.4, 0.3, 0.2, 0.15, 0.1];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              constraints: const BoxConstraints(
                minWidth: 1184,
                maxWidth: 1480,
                minHeight: 456,
                maxHeight: 604,
              ),
              child: AspectRatio(
                aspectRatio: 2.59,
                child: LayoutBuilder(
                  builder: (context, constraints) => CustomPaint(
                    painter: PathPainter(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Temperatures(constraints: constraints),
                        Expanded(
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 20),
                                  const Indicators(),
                                  const Spacer(),
                                  const Speeds(speeds: 54),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "images/icons/speed_miter.svg",
                                        height: 32,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8,
                                        ),
                                        child: Text(
                                          "60 KM/H",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  color:
                                                      const Color(0xFFA5B2FF)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Batteries(constraints: constraints),
                                ],
                              ),
                              ...List.generate(
                                speedLineOpacities.length,
                                (index) => Positioned(
                                  bottom: 20 + (2 * index).toDouble(),
                                  left: constraints.maxWidth * 0.13 -
                                      (30 * index),
                                  height: constraints.maxHeight * 0.8,
                                  width: constraints.maxWidth * 0.31,
                                  child: Opacity(
                                    opacity: speedLineOpacities[index],
                                    child: CustomPaint(
                                      painter: SpeedLinePainter(),
                                    ),
                                  ),
                                ),
                              ),
                              ...List.generate(
                                speedLineOpacities.length,
                                (index) => Positioned(
                                  bottom: 20 + (2 * index).toDouble(),
                                  right: constraints.maxWidth * 0.13 -
                                      (30 * index),
                                  height: constraints.maxHeight * 0.8,
                                  width: constraints.maxWidth * 0.31,
                                  child: Transform.scale(
                                    scaleX: -1,
                                    child: Opacity(
                                      opacity: speedLineOpacities[index],
                                      child: CustomPaint(
                                        painter: SpeedLinePainter(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
