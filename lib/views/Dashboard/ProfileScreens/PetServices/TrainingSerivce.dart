import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:pet_care_fyp/WidgetCommon/Button.dart';
import 'package:pet_care_fyp/controllers/Image_Controller/ImageController.dart';
import 'package:pet_care_fyp/controllers/Pets_Services/PetController.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../GoogleMap/AddLocationScreen.dart';

class TrainingSerivce extends StatefulWidget {
  const TrainingSerivce({super.key});

  @override
  State<TrainingSerivce> createState() => _TrainingSerivceState();
}

class _TrainingSerivceState extends State<TrainingSerivce> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _serviceTitleController = TextEditingController();
  final TextEditingController _serviceDescriptionController = TextEditingController();
  final TextEditingController _resultExpectController = TextEditingController();

  MultiSelectionController petController = Get.put(MultiSelectionController());
  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? selectedYear;
  String? selectedTrainingpets;
  bool _isloading = false;

  String? profileImg, img1, img2, img3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Training Service',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // add text field for image
                  const Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      'Upload image of your lovely house/compound where pets will be trained.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Card(
                          elevation: 8.0,
                          child: Container(
                            height: Get.height * 0.25,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                              image: profileImg == null
                                  ? const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/trainingprofile.png'))
                                  : DecorationImage(
                                      image: FileImage(
                                          File(profileImg.toString())),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: InkWell(
                            onTap: () async {
                              profileImg =
                                  await imagePickerController.GetImage();
                              setState(() {});
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
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
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Add lovely images of your pets',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // add three container for image
                  SizedBox(
                    height: Get.height * 0.1,
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: Get.height * 0.2,
                              width: Get.width * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                image: img1 == null
                                    ? const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/petimage.png'))
                                    : DecorationImage(
                                        image: FileImage(File(img1.toString())),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            // add shor addimage icon to add image of 20 * 20
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: InkWell(
                                onTap: () async {
                                  img1 = await imagePickerController.GetImage();
                                  setState(() {});
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              height: Get.height * 0.2,
                              width: Get.width * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                image: img2 == null
                                    ? const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/petimage.png'))
                                    : DecorationImage(
                                        image: FileImage(File(img2.toString())),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: InkWell(
                                onTap: () async {
                                  img2 = await imagePickerController.GetImage();
                                  setState(() {});
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              height: Get.height * 0.2,
                              width: Get.width * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                image: img3 == null
                                    ? const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/petimage.png'))
                                    : DecorationImage(
                                        image: FileImage(File(img3.toString())),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: InkWell(
                                onTap: () async {
                                  img3 = await imagePickerController.GetImage();
                                  setState(() {});
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Add service name or title',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    controller: _serviceTitleController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter service name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter service name',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Add service description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 2.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _serviceDescriptionController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter service description';
                          }
                          return null;
                        },
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: 'Give an overview of the service you offer.'
                              ' Tell us what a day look like and some fun things pets will get to do.',
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.grey),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'What results can the owner expect?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _resultExpectController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter expect result';
                          }
                          return null;
                        },
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText:
                              'Detail what type of results can the pet owner expect, eg: '
                              'Sit, Stay, Come, Down, Heel, Leave it, etc.',
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.grey),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'What pets do you train?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // add multiselect dropdown
                  const SizedBox(
                    height: 10,
                  ),
                  DropDownMultiSelect(
                    options: petController.allPetTypes,
                    whenEmpty: 'eg: Dog, Cat, Reptile',
                    onChanged: (value) {
                      petController.selectedPetTypes.value = value;
                      petController.selectedOption.value = "";

                      for (var value1 in petController.selectedPetTypes.value) {
                        petController.selectedOption.value =
                            "${petController.selectedOption.value}$value1";
                      }
                    },
                    selectedValues: petController.selectedPetTypes.value,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'How many year have you been a trainer?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // add dropdown to select year
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: DropdownButton<String>(
                        hint: const Text(
                          'Select year',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        isExpanded: true,
                        value: selectedYear,
                        borderRadius: BorderRadius.circular(10.0),
                        items: petController.expYears.map((option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedYear = value;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'What pet training course do you provide?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropDownMultiSelect(
                    options: petController.petTrainingCourse,
                    whenEmpty:
                        'eg: Basic Obedience training, Behavioral Training',
                    selectedValues: petController.selectedTrainingCourse.value,
                    onChanged: (value) {
                      petController.selectedTrainingCourse.value = value;
                      petController.selectedTrainingCourseOption.value = "";

                      for (var value1
                          in petController.selectedTrainingCourse.value) {
                        petController.selectedTrainingCourseOption.value =
                            "${petController.selectedTrainingCourseOption.value}$value1";
                      }
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'How many pets can you train at one time?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: DropdownButton<String>(
                        hint: const Text(
                          'eg: 1,5,9',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        isExpanded: true,
                        value: selectedTrainingpets,
                        borderRadius: BorderRadius.circular(10.0),
                        items: petController.years.map((option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedTrainingpets = value;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'What type fo classes do you offer?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropDownMultiSelect(
                    options: petController.petTrainingClasses,
                    selectedValues: petController.selectedTrainingClasses.value,
                    whenEmpty: 'eg: Private dog training , Group dog training ',
                    onChanged: (value) {
                      petController.selectedTrainingClasses.value = value;
                      petController.selectedTrainingClassesOption.value = "";

                      for (var value1
                          in petController.selectedTrainingClasses.value) {
                        petController.selectedTrainingClassesOption.value =
                            "${petController.selectedTrainingClassesOption.value}$value1";
                      }
                    },
                  ),

                  // add textfield for price
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'What is your price per session?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 4.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _priceController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter price';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter price',
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.grey),
                          prefixText: 'Usd  ',
                          suffixText: 'per session',
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  Center(
                    child: RoundedButton(
                      text: 'Add Service',
                      isloading: _isloading,
                      press: () {
                        if (_formKey.currentState!.validate()) {
                          setState((){_isloading = true;});
                          AddTrainingService();
                        }
                      },
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      width: Get.width * 0.9,
                      height: Get.height * 0.075,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> AddTrainingService()  async{

    // store all data in variable
    String? serviceTitle = _serviceTitleController.text;
    String? year = selectedYear;
    String? trainingPets = selectedTrainingpets;
    String? serviceDescription = _serviceDescriptionController.text;
    String? resultExpect = _resultExpectController.text;
    String? price = _priceController.text;


    List<String> trainingCourse = petController.selectedTrainingCourse.value;
    List<String> trainingClasses = petController.selectedTrainingClasses.value;
    List<String> petType = petController.selectedPetTypes.value;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('key', '6');

    String? uid= _auth.currentUser?.uid;

    _storage
        .ref()
        .child('TrainingService/$uid/profileImg')
        .putFile(File(profileImg.toString()))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        profileImg = value;
      });
    });

    _storage
        .ref()
        .child('TrainingService/$uid/image1')
        .putFile(File(img1.toString()))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        img1 = value;
      });
    });

    _storage
        .ref()
        .child('TrainingService/$uid/image2')
        .putFile(File(img2.toString()))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        img2 = value;
      });
    });

    _storage
        .ref()
        .child('TrainingService/$uid/image3')
        .putFile(File(img3.toString()))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        img3 = value;
      });
    });

    // add all data in map
    Map<String, dynamic> map = {
      'uid': uid,
      'profileImg': profileImg,
      'img1': img1,
      'img2': img2,
      'img3': img3,
      'serviceTitle': serviceTitle,
      'year': year,
      'trainingPets': trainingPets,
      'serviceDescription': serviceDescription,
      'resultExpect': resultExpect,
      'price': price,
      'trainingCourse': trainingCourse,
      'trainingClasses': trainingClasses,
      'petType': petType,
    };

    _priceController.clear();
    _serviceTitleController.clear();
    _serviceDescriptionController.clear();
    _resultExpectController.clear();



    await
    _firestore
        .collection('Services')
        .doc('userId')
        .collection('Veterinary')
        .doc(uid).set(map)
        .then((value) {
      setState(() {
        _isloading = false;
      });
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          'Success',
          'Grooming Service Added Successfully');
      Get.to(const AddLocation());
    }).catchError((error) {
      setState(() {
        _isloading = false;
      });
      Get.snackbar('Error', error.toString());
    });

  }
}
