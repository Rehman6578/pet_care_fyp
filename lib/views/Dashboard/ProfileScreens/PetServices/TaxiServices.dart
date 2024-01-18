import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:pet_care_fyp/WidgetCommon/Button.dart';
import 'package:pet_care_fyp/const/images.dart';
import 'package:pet_care_fyp/controllers/Pets_Services/PetController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../controllers/Image_Controller/ImageController.dart';
import '../../../GoogleMap/AddLocationScreen.dart';

class AddTaxiService extends StatefulWidget {
  const AddTaxiService({super.key});

  @override
  _AddTaxiServiceState createState() => _AddTaxiServiceState();
}

class _AddTaxiServiceState extends State<AddTaxiService> {
  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  MultiSelectionController petController = Get.put(MultiSelectionController());

  final TextEditingController _nameServicesController = TextEditingController();
  final TextEditingController _listingSummaryController =
      TextEditingController();
  final TextEditingController _DiscriptionsController = TextEditingController();
  final TextEditingController _preferredLocationController =
      TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _PetTaxiController = TextEditingController();
  String? selectedOption;

  String? profileImg, img1, img2, img3;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Taxi Service',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  'Upload image of your lovely house/compound where pets will be boarding.',
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
                                  image: FileImage(File(profileImg.toString())),
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
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Add lovely images of your pets',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
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
                height: 15,
              ),
              const SizedBox(height: 36.0),
              const Text(
                'Give a Name to your Service',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'You may use a combination of your city/town name and the service you '
                'provide and the pet you accept make your listing stand out against others.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Card(
                elevation: 4.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _nameServicesController,
                    validator: (value) {
                      return value!.isEmpty
                          ? 'Enter Pet Grooming Service'
                          : null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'eg: Pet Taxi Service',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Input for Professional Experience
              const Text(
                'Listing Summary',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Card(
                elevation: 2.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _listingSummaryController,
                    maxLines: 5,
                    validator: (value) {
                      return value!.isEmpty ? 'Enter Listing Summary' : null;
                    },
                    decoration: const InputDecoration(
                      hintText:
                          'Give an overview of what service you offer. Describe of '
                          '500 words and above will maximise your exposure.',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'How far are you willing to travel to visit a pet owner\'s home?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Obx(
                () => DropDownMultiSelect(
                  options: petController.PetVisiting,
                  selectedValues: petController.selectPetVisit.value,
                  onChanged: (value) {
                    petController.selectPetVisit.value = value;
                    petController.selecteVisit.value = "";

                    for (var value1 in petController.selectPetVisit.value) {
                      petController.selecteVisit.value =
                          "${petController.selecteVisit.value}$value1";
                    }
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'What pets do you accept?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Obx(() => DropDownMultiSelect(
                    options: petController.allPetTypes,
                    onChanged: (value) {
                      petController.selectedPetTypes.value = value;
                      petController.selectedOption.value = "";

                      for (var value1 in petController.selectedPetTypes.value) {
                        petController.selectedOption.value =
                            "${petController.selectedOption.value}$value1"; // interpolation
                      }
                    },
                    selectedValues: petController.selectedPetTypes.value,
                  )),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                'Size of pets do you accept?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 8.0,
              ),

              Obx(() => DropDownMultiSelect(
                    options: petController.SelectPetSizes,
                    onChanged: (value) {
                      petController.selectedPetSize1.value = value;
                      petController.selectedSize1.value = "";

                      for (var value1 in petController.selectedPetSize1.value) {
                        petController.selectedSize1.value =
                            "${petController.selectedSize1.value}$value1"; // interpolation
                      }
                    },
                    selectedValues: petController.selectedPetSize1.value,
                  )),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                'Do you have a dog seat belt strap OP a dog crate/carrier (You are required to provide either one)?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Obx(
                () => DropDownMultiSelect(
                  options: petController.petSeatBeltList,
                  onChanged: (value) {
                    petController.selectPetseatbelt.value = value;
                    petController.selectePetSeatBelt.value = "";

                    for (var value1 in petController.selectPetseatbelt.value) {
                      petController.selectePetSeatBelt.value =
                          "${petController.selectePetSeatBelt.value}$value1"; // interpolation
                    }
                  },
                  selectedValues: petController.selectPetseatbelt.value,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Preferred search location (optional)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Card(
                elevation: 2.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _preferredLocationController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText:
                          'Enter a landmark, key location, or area which you would like people'
                          ' who are searching for your service to find you in. This value can only be entered once.'
                          'E.g. Peshawar, Islamabad, Lahore, Karachi, etc.',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              Card(
                elevation: 2.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _priceController,
                    validator: (value) {
                      return value!.isEmpty ? 'Enter Price' : null;
                    },
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      prefixText: 'USD  ',
                      prefixStyle: TextStyle(color: Colors.black),
                      suffixText: '/trip',
                      suffixStyle:
                          TextStyle(color: Colors.black, wordSpacing: 10),
                      hintText: 'Your Price',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Pet owner will feel more comfortable knowing what is include in this quote',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Card(
                elevation: 4.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _DiscriptionsController,
                    validator: (value) {
                      return value!.isEmpty ? 'Enter Description' : null;
                    },
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              // Button to Add Service
              Center(
                  child: RoundedButton(
                text: 'Add Taxi Service',
                isloading: _loading,
                press: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _loading = true;
                    });
                    addTaxiServices();
                  }
                },
                color: Colors.lightBlue,
                textColor: Colors.white,
                width: 380,
                height: 70,
              )),
              const SizedBox(height: 30.0),
            ],
          ),
        )),
      ),
    );
  }

  // Add Taxi Service to Firebase
  Future<void> addTaxiServices() async {
    String nameServices = _nameServicesController.text;
    String listingSummary = _listingSummaryController.text;
    List<String> petVisit = petController.selectPetVisit;
    List<String> petTypes = petController.selectedPetTypes;
    List<String> petSize = petController.selectedPetSize1;
    List<String> petSeatBelt = petController.selectPetseatbelt;
    String preferredLocation = _preferredLocationController.text;
    String petTaxiSer = _PetTaxiController.text;
    String price = _priceController.text;
    String description = _DiscriptionsController.text;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('key', '7');

    // String uid = DateTime.now().microsecondsSinceEpoch.toString();
    String uid = Random().nextInt(1999999999).toString();
    // store Uid in shared preferences
    prefs.setString('uid', uid);

    _storage
        .ref()
        .child('TaxiServices/$uid/profileImg')
        .putFile(File(profileImg.toString()))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        profileImg = value;
      });
    });

    _storage
        .ref()
        .child('TaxiServices/$uid/img1')
        .putFile(File(img1.toString()))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        img1 = value;
      });
    });

    _storage
        .ref()
        .child('TaxiServices/$uid/img2')
        .putFile(File(img2.toString()))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        img2 = value;
      });
    });

    _storage
        .ref()
        .child('TaxiServices/$uid/img3')
        .putFile(File(img3.toString()))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        img3 = value;
      });
    });

    // add all the form data in map
    Map<String, dynamic> data = {
      'serviceName': nameServices,
      'summaryList': listingSummary,
      'petVisited': petVisit,
      'petType': petTypes,
      'petSize': petSize,
      'petSeatBelt': petSeatBelt,
      'preferredLocation': preferredLocation,
      'petTaxiService': petTaxiSer,
      'price': price,
      'description': description,
      'uid': uid,
      'profileImg': profileImg,
      'img1': img1,
      'img2': img2,
      'img3': img3,
    };

    _nameServicesController.clear();
    _listingSummaryController.clear();
    _preferredLocationController.clear();
    _PetTaxiController.clear();
    _priceController.clear();
    _DiscriptionsController.clear();

    // add data to firebase
    await
    _firestore
        .collection('Services')
        .doc('userId')
        .collection('TaxiServices')
        .doc(uid).set(data)
        .then((value) {
      setState(() {
        _loading = false;
      });
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          'Success',
          'Grooming Service Added Successfully');
      Get.to(const AddLocation());
    }).catchError((error) {
      setState(() {
        _loading = false;
      });
      Get.snackbar('Error', error.toString());
    });
  }
}
