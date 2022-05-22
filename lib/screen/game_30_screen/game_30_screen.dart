import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:tap_game_app/screen/game_30_screen/bounce_button.dart';
import 'package:tap_game_app/screen/game_30_screen/game_30_screen_controller.dart';

class Game30Screen extends StatelessWidget {
  const Game30Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Game30ScreenController());
    return Scaffold(
      backgroundColor: CupertinoColors.secondarySystemGroupedBackground,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          backgroundColor: CupertinoColors.secondarySystemGroupedBackground,
          elevation: 0,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              children: [
                const SizedBox(width: 15),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Obx(
                    () => Center(
                      child: Text(
                        '${controller.currentTime.value}秒',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width / 1.7,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Obx(
                    () => Center(
                      child: Text(
                        '${controller.playerScore.value}回',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.width / 1.5,
                  child: BounceButton(
                    key: key,
                    onPressed: controller.onTap,
                    textColor: Colors.black,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'タップ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
