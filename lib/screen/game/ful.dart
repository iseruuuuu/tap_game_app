// import 'package:flutter/material.dart';
//
// //TODO タイトル画面の作成　　　　　　　　　　　　　　　達成!!
// //TODO ステージの作成（レベル５ぐらいまでかな？）　　　達成!!
// //TODO 制限時間の設定　　　　　　　　　　　　　　　　　達成!!
// //TODO 相手（COM）OR 目標を作成する。　　　　　　　　　達成!!
// //TODO どのようにゲームを作り上げるかを考える　　　　　達成!!
// //TODO 成功したら、次のステージに進めるようにする？？　達成!!
// //TODO だめだったら、ダイアログを出す。　　　　　　　　達成!!
// //TODO 　一案目　　　時間制限にする。(30秒)　　　　　達成!!
// //TODO タイマーを作成　　　　　　　　　　　　　　　　　達成!!
//
//
// //TODO 達成したら解放されるものをデータとして扱う
//
//
//
// //TODO shared_preferences: ^0.4.3を登録　　達成!!
// //TODO クリアするとtrueにする。　　　　　　　　　
// //TODO 値を受け渡せるようにする。
//
//
//
//
//
// class FirstScreen extends StatefulWidget {
//   @override
//   First createState() => First();
//
// }
//
// class First extends State {
//
//   int _counter = 0;
//   double width = 300;
//   double height = 300;
//   double size = 30;
//   double size2 = 50;
//   int Playerscore = 50;
//   int Time = 30;
//   int current = 30;
//   bool TimerStart = false;
//
//
//   void _Pincrement() {
//     setState(() {
//       if (Playerscore == 0) {
//         showDialog(
//           context: context,
//           builder: (_) {
//             return const goodDialog();
//           },
//         );
//         //TODO クリアすると、数字を１にして値を渡す。
//         //TODO タイトルにも戻ったら、常に確認させる。
//         load3();
//       } else {
//         Playerscore--;
//       }
//     });
//   }
//
//   void initState() {
//     super.initState();
//   }
//
//
//   void startTimer() {
//     CountdownTimer countDownTimer = new CountdownTimer(
//       new Duration(seconds: Time), //初期値
//       new Duration(seconds: 1), //減らす幅
//     );
//
//     var sub = countDownTimer.listen(null);
//     sub.onData((duration) {
//       setState(() {
//         if (Playerscore == 0) {
//           sub.cancel();
//         } else {
//           current = Time - duration.elapsed.inSeconds; //毎秒減らしていく
//         }
//       });
//     });
//
//     sub.onDone(() {
//       print("Done");
//       if (Playerscore != 0) {
//         showDialog(
//           context: context,
//           builder: (_) {
//             return const badDialog();
//           },
//         );
//         current == 30;
//         Playerscore = 50;
//         TimerStart = false;
//       } else {
//         sub.cancel();
//         current = 30;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: const Text('Level 1'),
//         automaticallyImplyLeading: false,
//       ),
//       body: new Center(
//
//
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('残り時間は：あと $current秒'
//               , style: TextStyle(
//                   fontSize: 30
//               ),
//             ),
//
//             SizedBox(height: 50,),
//
//             Text('残り$Playerscore回でクリア',
//               style: TextStyle(
//                 fontSize: 30,
//               ),
//             ),
//
//             SizedBox(height: 50,),
//
//             ButtonTheme(
//               minWidth: width,
//               height: height,
//               child: RaisedButton(
//                   child: Text('押せ！'
//                     , style: TextStyle(fontSize: size,),
//                   ),
//                   textColor: Colors.white,
//                   onPressed: () {
//                     if (current == 0) {} else {
//                       _Pincrement();
//                     }
//                     if (TimerStart == false) {
//                       startTimer();
//                       TimerStart = true;
//                     }
//                   }
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//
//   //TODO 今のところは数をたせることができた。
//
//   //TODO 数字を渡せることができていない？？？
//
//
//   Future<void> load3() async {
//     //足した数字を記憶する。
//     final prefs = await SharedPreferences.getInstance();
//     int counter = (prefs.getInt('counter') ?? 0) + 1;
//     print('クリアしたよ。$counter回');
//     await prefs.setInt('counter', counter);
//   }
// }