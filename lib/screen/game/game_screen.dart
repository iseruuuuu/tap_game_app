import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'game_screen_state.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GameScreenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Level 1'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Text('残り時間は：あと $current秒'
            Obx(
              () => Text(
                '残り時間は：あと${controller.currentTime}秒',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            Obx(
              () => Text(
                '残り${controller.playerScore}回でクリア',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            ButtonTheme(
              minWidth: 300,
              height: 300,
              child: RaisedButton(
                child: Text(
                  '押せ！',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                textColor: Colors.white,
                //onPressed: controller.startTimer,
                onPressed: () {
                  if (controller.current == 0) {
                  } else {
                    //_Pincrement();
                    controller.pincrement();
                  }
                  // if (TimerStart == false) {
                  if (controller.timerStart == false) {
                    //startTimer();
                    //TimerStart = true;
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
