import 'package:flutter/material.dart';

class Speeds extends StatelessWidget {
  const Speeds({
    Key? key,
    this.speeds = 00,
  }) : super(key: key);

  final int speeds;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white.withOpacity(0),
            ],
          ).createShader(
            Rect.fromLTWH(0.0, 0.0, bounds.width, bounds.height),
          ),
          child: Text(
            "$speeds",
            style: const TextStyle(
              fontSize: 96,
              fontWeight: FontWeight.w500,
              height: 0.9,
            ),
          ),
        ),
        const Text(
          "KM/H",
          style: TextStyle(fontSize: 20, color: Colors.white30),
        )
      ],
    );
  }
}
