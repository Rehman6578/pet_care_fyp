import 'package:get/get.dart';

class VaccinatedController extends GetxController {
  RxBool vacine = false.obs;
  setNotification(bool value) {
    vacine.value = value;
    print(vacine.value);
  }
}
