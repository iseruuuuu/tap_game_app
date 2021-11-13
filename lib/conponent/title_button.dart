import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TitleButton extends StatelessWidget {
  const TitleButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.colors,
    required this.depth,
  }) : super(key: key);

  final String title;
  final Function() onTap;
  final Color colors;
  final double depth;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: NeumorphicStyle(
        depth: depth,
        color: colors,
      ),
      onPressed: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    );
  }
}
