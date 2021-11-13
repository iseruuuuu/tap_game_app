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
              style: NeumorphicStyle(
                depth: 0,
                //color: Colors.red,
                color: controller.level1.value ? Colors.red : Colors.white,
              ),
              onPressed: () {
                controller.level1.value ? controller.onTapGameStart() : null;
              },
              child: const Text(
                'Revel１',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            NeumorphicButton(
              style: NeumorphicStyle(
                depth: -20,
                color: controller.level2.value ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                controller.level2.value ? controller.onTapGameStart() : null;
              },
              child: const Text(
                'Revel 2',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            NeumorphicButton(
              style: NeumorphicStyle(
                depth: -20,
                color: controller.level3.value ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                controller.level3.value ? controller.onTapGameStart() : null;
              },
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
