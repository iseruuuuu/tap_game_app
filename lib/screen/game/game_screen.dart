import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'game_screen_state.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({
    Key? key,
    required this.level,
    required this.count,
    required this.keyword,
  }) : super(key: key);

  final int level;
  final int count;
  final String keyword;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GameScreenController(level: level, count: count),tag: keyword);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: NeumorphicText(
          'レベル$level',
          style: const NeumorphicStyle(
            depth: 4,
            color: Colors.white,
          ),
          textStyle: NeumorphicTextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Neumorphic(
              style: const NeumorphicStyle(
                depth: -20,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.width / 1.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(
                      () => Text(
                        '残り時間は：あと${controller.currentTime}秒',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Obx(
                      () => Text(
                        '残り${controller.playerScore}回でクリア',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.width / 1.5,
              child: NeumorphicButton(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(300),
                  ),
                  depth: 20,
                  lightSource: LightSource.topLeft,
                ),
                child: const Center(
                  child: Text(
                    'TAP',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: () {
                  if (controller.current == 0) {
                  } else {
                    controller.pincrement();
                  }
                  if (controller.timerStart == false) {
                    controller.startTimer();
                    controller.timerStart.value = true;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
