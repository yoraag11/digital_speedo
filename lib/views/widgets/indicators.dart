import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Indicators extends StatelessWidget {
  const Indicators({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: SvgPicture.asset(
            "images/icons/left_indicator.svg",
            height: 32,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: SvgPicture.asset(
            "images/icons/head_light.svg",
            height: 32,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: SvgPicture.asset(
            "images/icons/dipper.svg",
            height: 32,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: SvgPicture.asset(
            "images/icons/right_indicator.svg",
            height: 32,
          ),
        ),
      ],
    );
  }
}