import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Temperatures extends StatelessWidget {
  const Temperatures({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: constraints.maxWidth * 0.21,
      height: constraints.maxHeight * 0.11,
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.titleMedium!,
        child: Row(
          children: [
            const Text("02:05 PM"),
            const Spacer(),
            SvgPicture.asset(
              "images/icons/sun.svg",
              height: 32,
            ),
            const SizedBox(width: 4),
            const Text("28 °C"),
          ],
        ),
      ),
    );
  }
}
