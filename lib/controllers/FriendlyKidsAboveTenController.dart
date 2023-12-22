import 'package:get/get.dart';

class FriendlykidsaboveTenController extends GetxController {
  RxBool aboveten = false.obs;
  setNotification(bool value) {
    aboveten.value = value;
    print(aboveten.value);
  }
}
