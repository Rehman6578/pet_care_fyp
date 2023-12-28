import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../WidgetCommon/Button.dart';
import '../../../controllers/Image_Controller/ImageController.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());

    TextEditingController fullNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController aboutMeController = TextEditingController();

    String? profileImage;

    return Scaffold(
      //app bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Encode Sans',
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Center(
                  child: Stack(
                    children: [
                      Container(
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
                          image: profileImage == null
                              ? const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Background.png'),
                                  fit: BoxFit.cover,
                                )
                              : DecorationImage(
                                  image:
                                      FileImage(File(profileImage.toString())),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: InkWell(
                          onTap: () async {
                            profileImage =
                                await imagePickerController.GetImage();
                          },
                          child: Container(
                            width: 29,
                            height: 29,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    suffixIcon: fullNameController.text.isNotEmpty
                        ? const Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : null, // Show the check icon conditionally
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 16),
                child: Text(
                  "Gender",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            // Functionality for the first button
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.male, size: 32, color: Colors.white),
                              SizedBox(width: 4),
                              Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            // Functionality for the second button
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.female,
                                  size: 32, color: Colors.pinkAccent),
                              SizedBox(width: 4),
                              Text(
                                'Female',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'joh@gmail.com',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    suffixIcon: emailController.text.isNotEmpty
                        ? const Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : null, // Show the check icon conditionally
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  // controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: '123-456-7890',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    suffixIcon: phoneNumberController.text.isNotEmpty
                        ? const Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : null, // Show the check icon conditionally
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Me",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xfff7f7fa),
                        ),
                        child: TextFormField(
                          maxLines: 8,
                          controller: aboutMeController,
                          decoration: const InputDecoration(
                            hintText: 'Write about yourself...',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            // fillColor: Colors.white54,
                            // filled: true,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                    child: RoundedButton(
                  text: 'Get Started',
                  press: () {},
                  color: Colors.blue,
                  textColor: Colors.white,
                  width: 300,
                  height: 70,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
