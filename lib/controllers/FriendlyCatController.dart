import 'package:get/get.dart';

class FriendlycatsController extends GetxController {
  RxBool cats = false.obs;
  setNotification(bool value) {
    cats.value = value;
    print(cats.value);
  }
}
