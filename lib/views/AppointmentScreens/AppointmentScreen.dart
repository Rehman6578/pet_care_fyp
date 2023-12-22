import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/views_Controllers/Container_Controller.dart';
import 'PastScreen.dart';
import 'UpcomingScreen.dart';


class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {

  final MyContainerController controller = Get.put(MyContainerController());
  final MyContainerController containerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // create a container with match parent width and set height to 150 and use blur shadow
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow:  [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // add Appointments Text on center of the container with bold style
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: const Text(
                      'Appointments',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // add SizedBox with height 20
                  // add container with width of 300 and height of 50 and use row widget add two text widget one is 'Today' and other is 'Tomorrow' with bold style and selected color is blue container
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 40),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildTab('Upcoming'),
                          buildTab('Past'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 700,
              child:Obx(() {
                if (containerController.selectedItem.value == 'Upcoming') {
                  return UpcomingScreen();
                } else {
                  return PastScreen();
                }
              }),
            )
          ],
        ),
      ),
    );
  }

  buildTab(String text) {
    return Obx(() {
      bool isSelected = controller.selectedItem.value == text;

      return GestureDetector(
        onTap: () {
          controller.selectedItem.value = text;
        },
        child: Container(
          width: 155,
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : null,
            borderRadius: BorderRadius.circular(isSelected ? 25 : 0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    });
  }
}
