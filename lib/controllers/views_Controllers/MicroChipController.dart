import 'package:get/get.dart';

class MicrochippedController extends GetxController {
  RxBool microchipped = false.obs;
  setNotification(bool value) {
    microchipped.value = value;
    print(microchipped.value);
  }
}
