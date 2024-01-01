import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // create a container with match parent width and set height to 150 and use blur shadow
                margin: const EdgeInsets.all(5),
                width: Get.width,
                height: Get.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow:  const [
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
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
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
                      padding: const EdgeInsets.only(top: 35, left: 25, right: 25),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.04,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              SizedBox(
                height: 700,
                child:Obx(() {
                  if (containerController.selectedItem.value == 'Upcoming') {
                    return const UpcomingScreen();
                  } else {
                    return const PastScreen();
                  }
                }),
              )
            ],
          ),
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
          width: Get.width * 0.42,
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
