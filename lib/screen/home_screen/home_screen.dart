import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:tap_game_app/screen/home_screen/children/home_button.dart';
import 'package:tap_game_app/screen/home_screen/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController(), tag: '');
    return Scaffold(
      backgroundColor: CupertinoColors.secondarySystemGroupedBackground,
      appBar: AppBar(
        backgroundColor: CupertinoColors.secondarySystemGroupedBackground,
        elevation: 0,
      ),
      body: Center(
        child: GestureDetector(
          onTap: controller.sharedPreference,
          child: Column(
            children: [
              const Text(
                '連打ゲーム',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              HomeButton(
                title: '30秒連打モード',
                onTap: controller.onTap30,
                colors: Colors.blueAccent,
                depth: 100,
              ),
              const Spacer(),
              HomeButton(
                title: 'チャレンジモード',
                onTap: controller.onTapChallenge,
                colors: Colors.blueAccent,
                depth: 100,
              ),
              const Spacer(),
              HomeButton(
                title: '設定',
                onTap: controller.onTapSetting,
                colors: Colors.blueAccent,
                depth: 100,
              ),
              const SizedBox(height: 20),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
