import 'dart:async';
import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/material.dart';
import 'package:proste_dialog/proste_dialog.dart';
import 'package:get/get.dart';
import 'package:tap_game_app/preference/share_preferenced.dart';

class GameScreenController extends GetxController {
  GameScreenController({
    required this.level,
    required this.preferenceKey,
  });

  final int level;
  final PreferenceKey preferenceKey;
  var playerScore = 50.obs;
  var currentTime = 30.obs;
  bool isStart = false;
  var tapText = ''.obs;
  late Timer timer;

  @override
  void onInit() {
    super.onInit();
    tapText.value = 'スタート';
    checkLevel();
  }

  @override
  void onClose() {
    super.onClose();
    tapText.value = 'スタート';
  }

  void checkLevel() {
    switch (level) {
      case 1:
        playerScore.value = 50;
        break;
      case 2:
        playerScore.value = 70;
        break;
      case 3:
        playerScore.value = 90;
        break;
      case 4:
        playerScore.value = 110;
        break;
      case 5:
        playerScore.value = 120;
        break;
      case 999:
        playerScore.value = 400;
        break;
      default:
    }
  }

  void onTap() {
    if (isStart == false) {
      startGame();
    } else {
      if (playerScore.value == 0) {
        timer.cancel();
        successDialog();
      } else {
        playerScore.value--;
      }
    }
  }

  Future<void> startGame() async {
    openStartDialog();
    await Future.delayed(const Duration(seconds: 5));
    startTimer();
    isStart = true;
    tapText.value = 'タップ';
  }

  void startTimer() {
    const duration = Duration(seconds: 1);
    timer = Timer.periodic(
      duration,
      (Timer timer) {
        if (currentTime.value == 0) {
          isStart = false;
          timer.cancel();
          if (playerScore.value == 0) {
            timer.cancel();
            successDialog();
          } else {
            timer.cancel();
            failureDialog();
          }
        } else {
          isStart = true;
          currentTime.value--;
        }
      },
    );
  }

  Future<void> setPreference(PreferenceKey key) async {
    await Preference().setBool(key, true);
  }

  void successDialog() {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => ProsteDialog(
        title: const Text(
          'クリア！',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        content: const Text(
          '次のレベルが解禁されました！',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        showCancelButton: false,
        confirmButtonText: const Text(
          'タイトル画面へ',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        confirmButtonColor: Colors.pink,
        onConfirm: () {
          setPreference(preferenceKey);
          Get.back();
          Get.back();
          Get.back();
        },
      ),
    );
  }

  void failureDialog() {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => ProsteDialog(
        type: DialogTipType.error,
        title: const Text(
          'チャレンジ失敗!!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        content: const Text(
          'もう一度トライしよう!!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        showCancelButton: false,
        confirmButtonText: const Text(
          'もう一度',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        confirmButtonColor: Colors.pink,
        onConfirm: () {
          //TODO タイトルへ戻る
          Get.back();
          Get.back();
        },
      ),
    );
  }
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
