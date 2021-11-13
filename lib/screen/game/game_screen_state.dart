import 'package:flutter/material.dart';
import 'package:quiver/async.dart';
import 'package:get/get.dart';

class GameScreenController extends GetxController {
  int _counter = 0;

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

  void pincrement() {
    //TODO クリアした時
    if (Playerscore == 0) {
      //TODO クリアすると、数字を１にして値を渡す。
      //TODO タイトルにも戻ったら、常に確認させる。
    } else {
      Playerscore--;
      playerScore.value--;
    }
  }

  void startTimer() {
    print('start');
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(seconds: Time), //初期値
      Duration(seconds: 1), //減らす幅
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      if (Playerscore == 0) {
        sub.cancel();
      } else {
        current.value = Time - duration.elapsed.inSeconds; //毎秒減らしていく
        currentTime.value = Time - duration.elapsed.inSeconds; //毎秒減らしていく
      }
    });

    sub.onDone(() {
      print("Done");
      if (Playerscore != 0) {
        //TODO ダメだった時
        current == 30;
        Playerscore = 50;
        TimerStart = false;
        timerStart.value = false;
      } else {
        sub.cancel();
        current.value = 30;
      }
    });
  }
}
