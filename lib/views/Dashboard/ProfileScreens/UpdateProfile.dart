import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_care_fyp/controllers/Gender_Controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../WidgetCommon/Button.dart';
import '../../../WidgetCommon/gender_Button.dart';
import '../../../controllers/Image_Controller/ImageController.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  // String? profileImg;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  Uint8List? profileImg;

  GenderController genderController = Get.put(GenderController());

  @override
  void initState() {
    super.initState();
    getdataFromdatabse();
  }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
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
                      image: profileImg == null
                          ? const DecorationImage(
                              image: AssetImage('assets/images/doctor.png'))
                          : DecorationImage(
                              image: MemoryImage(profileImg!),
                          fit: BoxFit.cover,
                            ),
                    ),
                    child: Positioned(
                      bottom: 10,
                      right: 0,
                      child: InkWell(
                        onTap: () async {
                          profileImg =
                          await imagePickerController
                              .getMyImage(ImageSource.gallery);

                          setState(() {});
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
                  ),
                ],
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
              padding: const EdgeInsets.only(left: 20, top: 16),
              child: Text(
                "Gender",
                style: TextStyle(
                  fontSize: 18,
// use grey color for light theme
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildToggleButton('Male', Icons.male),
                  buildToggleButton('Female', Icons.female),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
            const SizedBox(height: 16),
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
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Me",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xfff7f7fa),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          maxLines: 8,
                          controller: aboutMeController,
                          decoration: const InputDecoration(
                            hintText: 'Write about yourself...',
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
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
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                  child: RoundedButton(
                text: 'Get Started',
                press: () {
                  UpdateProfileData();
                },
                color: Colors.blue,
                textColor: Colors.white,
                width: 300,
                height: 70,
              )),
            ),
          ],
        ),
      ),
    );
  }

  void getdataFromdatabse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString('uid');

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(uid).get();

    print(
        '==============================================================================');
    print(documentSnapshot['name']);
    print(documentSnapshot['email']);
    // set data to textfield
    fullNameController.text = documentSnapshot['name'];
    emailController.text = documentSnapshot['email'];
  }

  void UpdateProfileData() async {
    // upload image to firebase storage

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString('uid');

    print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ \n User id : ');
    print(uid);

    var profileImage = profileImg.toString();

    storage
        .ref()
        .child('UsersProfile/$uid/profileImg')
        .putString(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        profileImg = value as Uint8List?;
      });
    });

    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    _firestore.collection('users').doc(uid).update({
      'name': fullNameController.text,
      'email': emailController.text,
      'profileImg': profileImg,
      'phoneNumber': phoneNumberController.text,
      'Gender': genderController.selectedGender.value,
      'aboutMe': aboutMeController.text
    }).then((value) {
      Get.snackbar('Success', 'Profile Updated Successfully',
          snackPosition: SnackPosition.BOTTOM);
      Get.back();
    });
  }
}
