import 'package:get/get.dart';
import 'package:tap_game_app/screen/game/game_screen.dart';

class HomeScreenController extends GetxController {


  onTapGameStart() {
    Get.to(() => const GameScreen());
  }
}