import 'package:flutter/material.dart';
import 'dart:math';

class PetalsContainer extends StatelessWidget {
  final double height;
  final double width;
  final List<bool> petals1;
  final List<Color> petalColors1;
  final Function(int) removePetal;

  const PetalsContainer({
    required this.height,
    required this.width,
    required this.petals1,
    required this.petalColors1,
    required this.removePetal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 1.8,
      child: Stack(
        children: [
          for (int i = 0; i < petals1.length; i++)
            if (petals1[i])
              Positioned(
                top: height / 4.75 +
                    height / 9.5 * sin(2 * pi * i / petals1.length),
                left: height / 4.75 +
                    height / 9.5 * cos(2 * pi * i / petals1.length),
                child: Transform.rotate(
                  angle: -pi / 2 + (2 * pi * i / petals1.length),
                  child: GestureDetector(
                    onTap: () => removePetal(i),
                    child: ClipOval(
                      child: Container(
                        width: width / 7,
                        height: height / 5.6,
                        color: petalColors1[i % petalColors1.length],
                      ),
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}