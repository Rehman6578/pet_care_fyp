import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_fyp/views/SearchScreens/popup_screen.dart';
import 'package:pet_care_fyp/views/SearchScreens/veterinarydoctor_card_screen.dart';


import '../../const/colors.dart';
import '../../const/images.dart';
import '../AppointmentScreens/AppointmentScreen.dart';
import '../ProfileScreens/ProfileScreen.dart';

class NearVeterinaryScreen extends StatefulWidget {
  const NearVeterinaryScreen({super.key});

  @override
  _NearVeterinaryScreenState createState() => _NearVeterinaryScreenState();
}

class _NearVeterinaryScreenState extends State<NearVeterinaryScreen> {
  int selectedSegment = 0; // Default selected segment index

  Widget specialistWidgets() {
    // Define the widgets you want to show when "Specialist" is selected
    return const Column(
      children: [
        Text('Specialist Widgets'),
        // Add more widgets as needed
      ],
    );
  }

  Widget clinicsWidgets() {
    // Define the widgets you want to show when "Clinics" is selected
    return const Column(
      children: [
        Text('Clinics Widgets'),
        // Add more widgets as needed
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          padding: const EdgeInsetsDirectional.only(end: 10),
          middle: CupertinoSegmentedControl<int>(
            selectedColor: blue,
            padding: const EdgeInsetsDirectional.all(8),

            children: const {
              0: Text(
                'Specialist',
              ),
              1: Text('Clinics'),
            },
            groupValue: selectedSegment,
            onValueChanged: (value) {
              setState(() {
                selectedSegment = value;
              });
            },
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset((map), width: 20.0, height: 20.0),
              const SizedBox(width: 4.0),
              const Text(
                'Map',
                style: TextStyle(
                  fontSize: 16.0,
                  color: CupertinoColors.inactiveGray,
                ),
              ),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (selectedSegment == 0)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CupertinoSearchTextField(
                          placeholder: 'Search',
                          onSubmitted: (query) {
                            // Handle search query submission
                            print('Search query: $query');
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: blue, // Change this color to your desired background color
                              ),
                              child: const Row(
                                children: [
                                  Image(
                                    image: AssetImage(step),
                                    width: 20,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '9Steps',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            width: 14,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: blue, // Change this color to your desired background color
                              ),
                              child: const Row(
                                children: [
                                  Text(
                                    'Dentist',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            width: 14,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              child: const Row(
                                children: [
                                  Image(
                                    image: AssetImage(filter),
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text('Filter'),
                                ],
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.off(const VeterinaryDocScreen());
                              },
                              child: Card(
                                elevation: 5, // Adjust the card's shadow
                                child: Column(
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            img1, width: 100,
                                            //fit: BoxFit.cover,
                                          ),
                                        ),
                                        const Column(
                                          children: [
                                            Text(
                                              'Vasilenko Oksana',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Veterinary Dentist',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Row(
                                              children: [
                                                Image(image: AssetImage(star)),
                                                Text(
                                                  '125 Reviews',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 8.0, left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '10 years of experience',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          SizedBox(
                                            width: 11,
                                          ),
                                          CircleAvatar(
                                              child: Image(
                                            image: AssetImage(map),
                                            width: 20,
                                          )),
                                          Text('1.5km'),
                                          SizedBox(
                                            width: 11,
                                          ),
                                          CircleAvatar(
                                              child: Image(
                                            image: AssetImage(walet),
                                            width: 30,
                                          )),
                                          Image(
                                            image: AssetImage(dollar),
                                            width: 15,
                                          ),
                                          Text('20'),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                elevation: 5, // Adjust the card's shadow
                                child: Column(
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            img1, width: 100,
                                            //fit: BoxFit.cover,
                                          ),
                                        ),
                                        const Column(
                                          children: [
                                            Text(
                                              'Vasilenko Oksana',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Veterinary Dentist',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Row(
                                              children: [
                                                Image(image: AssetImage(star)),
                                                Text(
                                                  '125 Reviews',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 8.0, left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '10 years of experience',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          SizedBox(
                                            width: 11,
                                          ),
                                          CircleAvatar(
                                              child: Image(
                                            image: AssetImage(map),
                                            width: 20,
                                          )),
                                          Text('1.5km'),
                                          SizedBox(
                                            width: 11,
                                          ),
                                          CircleAvatar(
                                              child: Image(
                                            image: AssetImage(walet),
                                            width: 30,
                                          )),
                                          Image(
                                            image: AssetImage(dollar),
                                            width: 15,
                                          ),
                                          Text('20'),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                elevation: 5, // Adjust the card's shadow
                                child: Column(
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            img1, width: 100,
                                            //fit: BoxFit.cover,
                                          ),
                                        ),
                                        const Column(
                                          children: [
                                            Text(
                                              'Vasilenko Oksana',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Veterinary Dentist',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Row(
                                              children: [
                                                Image(image: AssetImage(star)),
                                                Text(
                                                  '125 Reviews',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 8.0, left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '10 years of experience',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          SizedBox(
                                            width: 11,
                                          ),
                                          CircleAvatar(
                                              child: Image(
                                            image: AssetImage(map),
                                            width: 20,
                                          )),
                                          Text('1.5km'),
                                          SizedBox(
                                            width: 11,
                                          ),
                                          CircleAvatar(
                                              child: Image(
                                            image: AssetImage(walet),
                                            width: 30,
                                          )),
                                          Image(
                                            image: AssetImage(dollar),
                                            width: 15,
                                          ),
                                          Text('20'),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                elevation: 5, // Adjust the card's shadow
                                child: Column(
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            img1, width: 100,
                                            //fit: BoxFit.cover,
                                          ),
                                        ),
                                        const Column(
                                          children: [
                                            Text(
                                              'Vasilenko Oksana',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Veterinary Dentist',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Row(
                                              children: [
                                                Image(image: AssetImage(star)),
                                                Text(
                                                  '125 Reviews',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 8.0, left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '10 years of experience',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          SizedBox(
                                            width: 11,
                                          ),
                                          CircleAvatar(
                                              child: Image(
                                            image: AssetImage(map),
                                            width: 20,
                                          )),
                                          Text('1.5km'),
                                          SizedBox(
                                            width: 11,
                                          ),
                                          CircleAvatar(
                                              child: Image(
                                            image: AssetImage(walet),
                                            width: 30,
                                          )),
                                          Image(
                                            image: AssetImage(dollar),
                                            width: 15,
                                          ),
                                          Text('20'),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                else if (selectedSegment == 1)
                  const Row(
                    children: [Text('clinics screen')],
                  )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (int index) {
          // Respond to item press.
          if (index == 3) {
            // Navigate to the ProfileScreen when the "Profile" item is tapped.
            Get.to(const ProfileScreen());
          }
          if (index == 1) {
            Get.to(const AppointmentScreen());
          }
          if (index == 2) {
            Get.to(const PopupScreen());
          }
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Appointments',
            icon: Icon(Icons.watch_later_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Explore',
            icon: Icon(Icons.explore_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person_outline_outlined),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const CupertinoApp(
      home: NearVeterinaryScreen(),
    ),
  );
}

// import 'package:flutter/cupertino.dart';
//
// void main() {
//   runApp(
//     CupertinoApp(
//       home: CupertinoTabScaffold(
//         tabBar: CupertinoTabBar(
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.search),
//               label: 'Search',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.settings),
//               label: 'Settings',
//             ),
//           ],
//         ),
//         tabBuilder: (context, index) {
//           // Replace with the content for each tab
//           switch (index) {
//             case 0:
//               return CupertinoPageScaffold(
//                 navigationBar: CupertinoNavigationBar(
//                   middle: Text('Home'),
//                 ),
//                 child: Center(
//                   child: Text('Home Page Content Goes Here'),
//                 ),
//               );
//             case 1:
//               return CupertinoPageScaffold(
//                 navigationBar: CupertinoNavigationBar(
//                   middle: Text('Search'),
//                 ),
//                 child: Center(
//                   child: Text('Search Page Content Goes Here'),
//                 ),
//               );
//             case 2:
//               return CupertinoPageScaffold(
//                 navigationBar: CupertinoNavigationBar(
//                   middle: Text('Settings'),
//                 ),
//                 child: Center(
//                   child: Text('Settings Page Content Goes Here'),
//                 ),
//               );
//             default:
//               return CupertinoPageScaffold(
//                 navigationBar: CupertinoNavigationBar(
//                   middle: Text('Error'),
//                 ),
//                 child: Center(
//                   child: Text('Error: Page Not Found'),
//                 ),
//               );
//           }
//         },
//       ),
//     ),
//   );
// }
