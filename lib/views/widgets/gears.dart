import 'package:flutter/material.dart';

class Gears extends StatelessWidget {
  const Gears({
    Key? key,
    this.gears = const ["S", "D", "N", "R", "P"],
  }) : super(key: key);
  final List<String> gears;

  @override
  Widget build(BuildContext context) {
    int selectedGearIdx = 1;
    // TODO: implement build
    return SizedBox(
      width: 140,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              gears.length,
              (index) => Text(
                gears[index],
                style: TextStyle(
                  fontSize: index == selectedGearIdx ? 28 : 20,
                  color: index == selectedGearIdx
                      ? const Color(0xFFff4500)
                      : Colors.white.withOpacity(0.16),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
