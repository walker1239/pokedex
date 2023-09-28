import 'package:flutter/material.dart';

class StrengthBar extends StatelessWidget {
  final int maxValue = 255;
  final int currentValue;
  final double width;
  final Color color;

  const StrengthBar(
      {super.key,
      required this.currentValue,
      required this.color,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: 4,
          color: color.withOpacity(0.5),
        ),
        Container(
          width: (currentValue / maxValue) * width,
          height: 4,
          color: color,
        ),
      ],
    );
  }
}
