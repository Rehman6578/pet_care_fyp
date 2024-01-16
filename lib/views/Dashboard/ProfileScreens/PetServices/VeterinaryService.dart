import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:pet_care_fyp/WidgetCommon/Button.dart';
import 'package:pet_care_fyp/controllers/Pets_Services/PetController.dart';
import 'package:pet_care_fyp/views/GoogleMap/AddLocationScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../controllers/Image_Controller/ImageController.dart';

class AddVeterinaryService extends StatefulWidget {
  const AddVeterinaryService({super.key});

  @override
  _AddVeterinaryServiceState createState() => _AddVeterinaryServiceState();
}

class _AddVeterinaryServiceState extends State<AddVeterinaryService> {


  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  MultiSelectionController petController = Get.put(MultiSelectionController());

  // TextEditingController for handling input
  final TextEditingController _doctorNameController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _specializationController = TextEditingController();
  final TextEditingController _personalInfoController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _offeredServicesController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  String? selectedOption;
  String? experienceYears;
  String? gender;

  String? profileImg, img1, img2, img3;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  // final FirebaseDatabase _database = FirebaseDatabase.instance;

  final formkey = GlobalKey<FormState>();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    print('build app');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Veterinary Service',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // add imageview for adding doctor image
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
                                    image:
                                        AssetImage('assets/images/doctor.png'))
                                : DecorationImage(
                                    image:
                                        FileImage(File(profileImg.toString())),
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
                            profileImg = await imagePickerController.GetImage();
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
                const SizedBox(height: 36.0),
                const Text(
                  'Add lovely images of your pets:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                // add container to get three more images
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
                const SizedBox(height: 40),
                // Input for Doctor's Name
                const Text(
                  'Doctor\'s Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Card(
                  elevation: 2.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _doctorNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter doctor\'s name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter doctor/clinic name',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Select Gender',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
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
                        'Select Gender',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      isExpanded: true,
                      value: gender,
                      borderRadius: BorderRadius.circular(10.0),
                      items: petController.Gender.map((option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                // Input for Professional Experience
                const Text(
                  'Professional Experience',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Card(
                  elevation: 2.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _experienceController,
                      maxLines: 5,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter professional experience please';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter professional experience',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'How many years fo Experience you have?',
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
                        'eg: 1,3,5',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      isExpanded: true,
                      value: experienceYears,
                      borderRadius: BorderRadius.circular(10.0),
                      items: petController.years.map((option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          experienceYears = value;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                // Input for Specialization
                const Text(
                  'Specialization',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Card(
                  elevation: 2.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _specializationController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter specialization please';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter specialization',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                // Input for Personal Information
                const Text(
                  'Personal Information',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Card(
                  elevation: 2.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _personalInfoController,
                      maxLines: 5,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter personal information please';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter personal information',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                // Input for Education
                const Text(
                  'Education',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Card(
                  elevation: 2.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _educationController,
                      maxLines: 3,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter education please';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter education details',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                // Input for Offered Services
                const Text(
                  'Offered Services',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Card(
                  elevation: 2.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _offeredServicesController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter offered services please';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter offered services',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                // Input for Accepted Pet Types
                const Text(
                  'What pets do you accept?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => DropDownMultiSelect(
                    options: petController.allPetTypes,
                    whenEmpty: 'eg: Dog, Cat, Reptile',
                    onChanged: (value) {
                      if (value.isEmpty) {
                        return 'Please select pet type';
                      }
                      petController.selectedPetTypes.value = value;
                      petController.selectedOption.value = "";

                      for (var value1 in petController.selectedPetTypes.value) {
                        petController.selectedOption.value =
                            "${petController.selectedOption.value}$value1";
                      }
                    },
                    selectedValues: petController.selectedPetTypes.value,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Size of pet you accept?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Obx(() => DropDownMultiSelect(
                    options: petController.SelectPetSizes,
                    selectedValues: petController.selectedPetSize1.value,
                    whenEmpty: 'eg: 1-5kg , 15-20kg',
                    onChanged: (value) {
                      if (value.isEmpty) {
                        return 'Please select pet size';
                      }
                      petController.selectedPetSize1.value = value;
                      petController.selectedSize1.value = "";

                      for (var value1 in petController.selectedPetSize1.value) {
                        petController.selectedSize1.value =
                            "${petController.selectedSize1.value}$value1";
                      }
                    })),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  'Do you have transport for emergencies?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16.0,
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
                      hint: const Text('Yes/No'),
                      isExpanded: true,
                      value: selectedOption,
                      menuMaxHeight: 100,
                      borderRadius: BorderRadius.circular(10.0),
                      items: petController.options.map((option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }

                        setState(() {
                          selectedOption = value;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Price:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Card(
                  elevation: 4.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _priceController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter price please';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter the price',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),

                // Button to Add Service
                Center(
                  child: RoundedButton(
                    text: 'Add Veterinary Service',
                    isloading: _loading,
                    press: () {
                      if (formkey.currentState!.validate()) {
                        setState(() {
                          _loading = true;
                        });

                        addVeterinaryService();
                        Get.snackbar(
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(seconds: 3),
                            'Success',
                            'Veterinary Service Added Successfully');
                        Get.to(const AddLocation());
                      }
                    },
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                    width: 380,
                    height: 70,
                  ),
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to add the veterinary service
  Future<void> addVeterinaryService() async {
    String doctorName = _doctorNameController.text;
    String experience = _experienceController.text;
    String specialization = _specializationController.text;
    String personalInfo = _personalInfoController.text;
    String education = _educationController.text;
    String experienceY = experienceYears.toString();
    String Gender = gender.toString();
    List<String> acceptedPets = petController.selectedPetTypes.value;
    String offeredServices = _offeredServicesController.text;
    List<String> acceptedPetTypes = petController.selectedPetSize1.value;
    double price = double.tryParse(_priceController.text) ?? 0.0;


    // create instace of shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('key', '1');

    // String uid = DateTime.now().microsecondsSinceEpoch.toString();
    String? uid = _auth.currentUser?.uid;

    _storage
        .ref()
        .child('veterinaryServices/$uid/profileImg')
        .putFile(File(profileImg.toString()))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        profileImg = value;
      });
    });

    _storage
        .ref()
        .child('veterinaryServices/$uid/img1')
        .putFile(File(img1.toString()))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        img1 = value;
      });
    });

    _storage
        .ref()
        .child('veterinaryServices/$uid/img2')
        .putFile(File(img2.toString()))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        img2 = value;
      });
    });

    _storage
        .ref()
        .child('veterinaryServices/$uid/img3')
        .putFile(File(img3.toString()))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        img3 = value;
      });
    });

    // add all the form data in map

    Map<String, dynamic> data = {
      'doctorName': doctorName,
      'gender': Gender,
      'experience': experience,
      'experienceYears': experienceY,
      'specialization': specialization,
      'personalInfo': personalInfo,
      'education': education,
      'acceptedPets': acceptedPets,
      'offeredServices': offeredServices,
      'acceptedPetTypes': acceptedPetTypes,
      'price': price,
      'uid': uid,
      'profileImg': profileImg,
      'img1': img1,
      'img2': img2,
      'img3': img3,
    };

    _doctorNameController.clear();
    _experienceController.clear();
    _specializationController.clear();
    _personalInfoController.clear();
    _educationController.clear();
    _offeredServicesController.clear();
    _priceController.clear();



    // add all the data in firebase database in services node and veterinary node by its user id

    await
    _firestore
        .collection('Services')
        .doc('userId')
        .collection('Veterinary')
        .doc(uid).set(data);

  }
}

// FirebaseFirestore.instance.collection('Services').doc('userId').collection('Boarding')
