import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tap_game_app/screen/home/home_screen_controller.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            NeumorphicText(
              '連打ゲーム',
              textStyle: NeumorphicTextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            NeumorphicText(
              'Mash Game',
              textStyle: NeumorphicTextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            NeumorphicButton(
              style: const NeumorphicStyle(
                depth: 0,
                color: Colors.red,
              ),
              onPressed: () {},
              child: const Text(
                'Revel１',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            NeumorphicButton(
              style: const NeumorphicStyle(
                depth: -20,
              ),
              onPressed: () {},
              child: const Text(
                'Revel 2',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            NeumorphicButton(
              style: const NeumorphicStyle(
                depth: -20,
              ),
              onPressed: () {},
              child: const Text(
                'Revel 3',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
