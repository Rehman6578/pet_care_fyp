import 'package:get/get.dart';

class InformationController extends GetxController {
  RxBool notification = false.obs;
  setNotification(bool value) {
    notification.value = value;
    print(notification.value);
  }
}
