import 'dart:async';
import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tap_game_app/preference/share_preferenced.dart';

class Game30ScreenController extends GetxController {
  bool isStart = false;
  var playerScore = 0.obs;
  var currentTime = 30.obs;
  var highScore = 0.obs;
  var tapText = ''.obs;
  late Timer timer;

  @override
  void onInit() {
    super.onInit();
    tapText.value = 'スタート';
    loadHighScore();
  }

  @override
  void onClose() {
    super.onClose();
    timer.cancel();
    tapText.value = 'スタート';
  }

  void loadHighScore() async {
    highScore.value = await Preference().getInt(PreferenceKey.highScore);
  }

  Future<void> setHighScore() async {
    if (highScore.value < playerScore.value) {
      await Preference().setInt(PreferenceKey.highScore, playerScore.value);
      highScore.value == playerScore.value;
    }
  }

  Future<void> startGame() async {
    openStartDialog();
    await Future.delayed(const Duration(seconds: 5));
    startTimer();
    isStart = true;
    tapText.value = 'タップ';
  }

  void openStartDialog() {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(15),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: SizedBox(
            width: MediaQuery.of(Get.context!).size.width,
            height: MediaQuery.of(Get.context!).size.width,
            child: TimeCircularCountdown(
              //現在の時間
              countdownCurrentColor: Colors.black,
              //まだ過ぎていない時間
              countdownRemainingColor: Colors.grey,
              //過ぎた時間
              countdownTotalColor: Colors.black,
              unit: CountdownUnit.second,
              countdownTotal: 5,
              onFinished: () => Get.back(),
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 90,
              ),
            ),
          ),
        );
      },
    );
  }

  void onTap() {
    if (isStart == false) {
      startGame();
    } else {
      playerScore.value++;
    }
  }

  void startTimer() {
    const duration = Duration(seconds: 1);
    timer = Timer.periodic(
      duration,
      (Timer timer) {
        if (currentTime.value == 0) {
          setHighScore();
          isStart = false;
          timer.cancel();
          openResultDialog();
        } else {
          isStart = true;
          currentTime.value--;
        }
      },
    );
  }

  void reset() {
    Get.back();
    playerScore.value = 0;
    currentTime.value = 30;
    isStart = false;
    tapText.value = 'スタート';
  }

  void onTapBack() {
    Get.back();
  }

  void onTapBackTitle() {
    Get.back();
    Get.back();
  }

  void openResultDialog() {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(15),
          backgroundColor: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Column(
            children: [
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'スコア',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Center(
                child: Text(
                  '${playerScore.value}点',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
          content: SizedBox(
            width: MediaQuery.of(Get.context!).size.width,
            height: 100,
            child: Text(
              'これまでのハイスコア　　　${highScore.value}点',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          actions: [
            Column(
              children: [
                const SizedBox(height: 30),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(Get.context!).size.width / 2.8,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            onPrimary: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'タイトル',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: onTapBackTitle,
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(Get.context!).size.width / 2.8,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFFD850F),
                            onPrimary: const Color(0xFFFD850F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'リトライ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: reset,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ),
          ],
        );
      },
    );
  }
}
