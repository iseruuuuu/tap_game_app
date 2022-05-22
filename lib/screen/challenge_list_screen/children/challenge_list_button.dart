import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ChallengeListButton extends StatelessWidget {
  const ChallengeListButton({
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
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: NeumorphicButton(
        style: NeumorphicStyle(
          depth: depth,
          color: colors,
        ),
        onPressed: onTap,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}
