import 'package:flutter/material.dart';
import 'package:proste_dialog/proste_dialog.dart';
import 'package:quiver/async.dart';
import 'package:get/get.dart';
import 'package:tap_game_app/preference/share_preferenced.dart';
import 'package:tap_game_app/screen/home/home_screen_controller.dart';

class GameScreenController extends GetxController {
  GameScreenController({
    required this.level,
  });

  final int level;

  int Time = 30;

  bool TimerStart = false;
  var timerStart = false.obs;

//タップしなければならない回数
  int Playerscore = 50;
  var playerScore = 50.obs;

  //残り時間
  //int current = 30;
  var currentTime = 30.obs;
  var current = 30.obs;

  //HomeScreenController get controller => Get.find<HomeScreenController>();
  HomeScreenController get controller => Get.put(HomeScreenController());

  @override
  void onInit() {
    super.onInit();
    checkLevel();
  }

  void pincrement() {
    if (playerScore == 0) {
      successDialog();
      checkLevel();
      controller.sharedPreference();
      successDialog();
    } else {
      Playerscore--;
      playerScore.value--;
    }
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

  void successDialog() {
    showDialog(
      context: Get.overlayContext!,
      builder: (_) => ProsteDialog(
        title: const Text(
          'クリアです！',
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
          controller.sharedPreference();
          Get.back();
          Get.back();
        },
      ),
    );
  }

  void startTimer() {
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(seconds: Time),
      Duration(seconds: 1),
    );
    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      if (Playerscore == 0) {
        sub.cancel();
      } else {
        currentTime.value = Time - duration.elapsed.inSeconds;
      }
    });
    sub.onDone(() {
      if (Playerscore != 0) {
        //TODO ダメだった時
        current == 30;
        Playerscore = 50;
        TimerStart = false;
        timerStart.value = false;
        checkLevel();
        failureDialog();
      } else {
        sub.cancel();
        current.value = 30;
      }
    });
  }



  void failureDialog() {
    showDialog(
      context: Get.overlayContext!,
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
          'タイトル画面へ',
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
