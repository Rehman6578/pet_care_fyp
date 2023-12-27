import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/views_Controllers/MainWrapperController.dart';
import '../AppointmentScreens/AppointmentScreen.dart';
import 'Navbar_Screen/HomeNavbar.dart';
import 'ProfileScreens/ProfileScreen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  final MainWrapperController controller = Get.put(MainWrapperController());

  final List<Widget> _children = [
    home_nav(),
    AppointmentScreen(),
    home_nav(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Obx(() => _children[controller.currentIndex.value]),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: controller.currentIndex.value,
        onTap: controller.changePage,
        selectedLabelStyle : const TextStyle(fontWeight: FontWeight.bold),
        selectedIconTheme: const IconThemeData(size: 30),mouseCursor: SystemMouseCursors.click,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_sharp),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );

  }
}
