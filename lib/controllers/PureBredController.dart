import 'package:get/get.dart';

class PurebredController extends GetxController {
  RxBool purebred = false.obs;
  setNotification(bool value) {
    purebred.value = value;
    print(purebred.value);
  }
}
