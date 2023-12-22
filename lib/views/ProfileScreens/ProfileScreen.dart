import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_fyp/views/ProfileScreens/profile.dart';

import '../../WidgetCommon/profile_listitems.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                Get.to(const ProfileScreen());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                // Align icon and text vertically
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        Get.to(EditProfile());
                      }),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10, right: 10.0),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ], // Ensure minimum space
                // Add padding: EdgeInsets.all(0) to remove any extra padding/margin
              ),
            ),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: const Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Encode Sans',
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 266,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 5.0), // shadow direction: bottom right
                  )
                ],
              ),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Container(
                            height: 112,
                            width: 112,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 0,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                ),
                              ],
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                image: AssetImage('assets/images/Ellipse.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Maria Martinez',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Encode Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Kiev', // Add your text content
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Encode Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 16, // Adjust the font size
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: GestureDetector(
                  onTap: () {},
                  child: profile_list(
                      image: Image.asset('assets/images/mypet.png'),
                      name: 'My Pets'),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: GestureDetector(
                  onTap: () {},
                  child: profile_list(
                    image: Image.asset('assets/images/favourite.png'),
                    name: 'My Favourites',
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: GestureDetector(
                  onTap: () {},
                  child: profile_list(
                    image: Image.asset('assets/images/medico.png'),
                    name: 'Add Pets Services',
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: GestureDetector(
                  onTap: () {},
                  child: profile_list(
                    image: Image.asset('assets/images/announcement.png'),
                    name: 'Invite Freinds',
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: GestureDetector(
                    onTap: () {},
                    child: profile_list(
                      image: Image.asset('assets/images/question.png'),
                      name: 'Help',
                    ))),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: GestureDetector(
                onTap: () {},
                child: profile_list(
                  image: Image.asset('assets/images/settingsgear.png'),
                  name: 'Settings',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
