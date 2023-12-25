import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FriendlydogsController extends GetxController {
  RxBool dogs = false.obs;
  setNotification(bool value) {
    dogs.value = value;
    print(dogs.value);
  }
}
