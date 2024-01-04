

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controllers/Gender_Controller.dart';

Widget buildToggleButton(String gender , IconData icon) {

  final GenderController genderController = Get.put(GenderController());

  return Obx(() {
    bool isSelected = genderController.selectedGender.value == gender;

    return ElevatedButton(
      onPressed: () {
        genderController.selectGender(gender , icon);
      },
      style: ButtonStyle(
        backgroundColor: isSelected
            ? MaterialStateProperty.all<Color>(Colors.blue)
            : MaterialStateProperty.all<Color>(Colors.white),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.red,
          ),
          const SizedBox(width: 8), // Add some spacing between icon and text
          Text(
            gender,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),

        ],
      )
      );
  });
}