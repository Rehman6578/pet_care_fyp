
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GenderController extends GetxController {
  RxString selectedGender = ''.obs;

  void selectGender(String gender, IconData icon) {
    selectedGender.value = gender;
  }
}