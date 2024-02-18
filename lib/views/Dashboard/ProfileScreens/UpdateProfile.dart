import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_care_fyp/Services/firebase_storage_service.dart';
import '../../../Services/image_picker.dart';
import '../../../WidgetCommon/Button.dart';
import 'ProfileScreen.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final service = ImagePickerService();
  File? _pickedImage;

  String image = '';
  TextEditingController fullNameController = TextEditingController();
  String gender = 'Male';
  bool isMale = true;

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();

  Future<void> fetchData() async {
    String? uid = auth.currentUser?.uid;
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      DocumentSnapshot documentSnapshot = await users.doc(uid).get();

      Map<String, dynamic>? userData =
          documentSnapshot.data() as Map<String, dynamic>?;
      if (userData != null) {
        print('>>>>>>>>>>>>>>>');
        print(userData['Gender']);
        setState(() {
          image = userData['image'];
          fullNameController.text = userData['name'];

          phoneNumberController.text = userData['phoneNumber'];
          aboutMeController.text = userData['aboutMe'];

          userData['Gender'] == 'Male' ? isMale = true : isMale = false;
        });
      } else {
        print('User data not found.');
      }
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 112,
                width: 112,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 0,
                  ),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () async {
                    await service
                        .imagePick(source: ImageSource.camera)
                        .then((value) {
                      setState(() {
                        _pickedImage = value;
                      });
                    });
                  },
                  child: _pickedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(_pickedImage!, fit: BoxFit.cover))
                      : Container(
                          width: 29,
                          height: 29,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                            image: image.isNotEmpty
                                ? DecorationImage(
                                    image: NetworkImage(
                                      image,
                                    ),
                                    fit: BoxFit.cover)
                                : null,
                          ),
                          child: image.isNotEmpty
                              ? null
                              : const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                        ),
                ),
              ),
            ),
            TextFormField(
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
            const SizedBox(height: 16),
            Text(
              "Gender",
              style: TextStyle(
                fontSize: 18,
                // use grey color for light theme
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        gender = 'Male';

                        isMale = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: isMale ? Colors.blue : Colors.white),
                    // style: ButtonStyle(
                    //   backgroundColor: isMale
                    //       ? MaterialStateProperty.all<Color>(Colors.blue)
                    //       : MaterialStateProperty.all<Color>(Colors.white),
                    // ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.male,
                          color: isMale ? Colors.white : Colors.red,
                        ),
                        const SizedBox(
                            width: 8), // Add some spacing between icon and text
                        Text(
                          'Male',
                          style: TextStyle(
                            color: isMale ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    )),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        gender = 'Female';
                        isMale = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isMale == false ? Colors.blue : Colors.white),
                    child: Row(
                      children: [
                        Icon(
                          Icons.female,
                          color: isMale == false ? Colors.white : Colors.red,
                        ),
                        const SizedBox(
                            width: 8), // Add some spacing between icon and text
                        Text(
                          'Female',
                          style: TextStyle(
                            color:
                                isMale == false ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    )),
                // GenderButton(
                //   gender: 'Male',
                //   icon: Icons.male,
                //   // isSelected: gender == 'Male',
                //   onTap: () {
                //     setState(() {
                //       gender == 'Male';
                //     });
                //   },
                // ),
                // GenderButton(
                //   gender: 'Female',
                //   // isSelected: gender == 'Female',
                //   onTap: () {
                //     setState(() {
                //       gender == 'Female';
                //     });
                //   },
                //   icon: Icons.male,
                // ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: phoneNumberController,
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
            const SizedBox(height: 16),
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                  child: RoundedButton(
                text: 'Get Started',
                press: () {
                  updateProfileData();
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

  void updateProfileData() async {
    // upload image to firebase storage
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    String? uid = auth.currentUser?.uid;
    // String? email = auth.currentUser?.email;

    print(
        '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ \n User id : ');
    print(uid);
    print('Gender>>>>>>>>>>>>>');
    print(gender);

    final profileUrl = _pickedImage == null
        ? image
        : (await FirebaseStorageService().uploadToStorage(file: _pickedImage))!;

    firestore.collection('users').doc(uid).update({
      'name': fullNameController.text,
      'image': profileUrl,
      'phoneNumber': phoneNumberController.text,
      'Gender': gender,
      'aboutMe': aboutMeController.text
    }).then((value) {
      print('done');
      Get.offAll(() => const ProfileScreen());
    });
  }
}
