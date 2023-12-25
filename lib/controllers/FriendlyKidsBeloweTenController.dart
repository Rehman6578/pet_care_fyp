import 'package:get/get.dart';

class FriendlykidsbeloveTenController extends GetxController {
  RxBool beloveten = false.obs;
  setNotification(bool value) {
    beloveten.value = value;
    print(beloveten.value);
  }
}
