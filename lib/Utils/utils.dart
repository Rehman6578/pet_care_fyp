
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToastMessage {
  void showSnackBar(String message) {
    Get.snackbar(
      '',
      '',
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
      snackPosition: SnackPosition.BOTTOM,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      borderRadius: 10,
      backgroundGradient: const LinearGradient(
        colors: [Colors.blue, Colors.blueAccent]),
      duration: const Duration(seconds: 3),
    );
  }
}
