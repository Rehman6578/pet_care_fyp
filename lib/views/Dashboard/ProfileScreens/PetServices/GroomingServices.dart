import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:pet_care_fyp/WidgetCommon/Button.dart';
import 'package:pet_care_fyp/controllers/Pets_Services/PetController.dart';
import 'package:pet_care_fyp/views/GoogleMap/AddLocationScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../controllers/Image_Controller/ImageController.dart';

class AddGroomingService extends StatefulWidget {
  const AddGroomingService({super.key});

  @override
  _AddGroomingServiceState createState() => _AddGroomingServiceState();
}

class _AddGroomingServiceState extends State<AddGroomingService> {
  final _formKey = GlobalKey<FormState>();

  ImagePickerController imagePickerController = Get.put(ImagePickerController());
  MultiSelectionController petController = Get.put(MultiSelectionController());

  final TextEditingController _nameServicesController = TextEditingController();
  final TextEditingController _listingSummaryController = TextEditingController();
  final TextEditingController _DiscriptionsController = TextEditingController();
  final TextEditingController _preferredLocationController = TextEditingController();
  final TextEditingController _SpapriceController = TextEditingController();
  final TextEditingController _BasicpriceController = TextEditingController();
  final TextEditingController _FullpriceController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? selectedOption;

  String? profileImg;
  String? img1;
  String? img2;
  String? img3;

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Grooming Service',
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
                        hintText: 'eg: Pet Grooming Service',
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
                const SizedBox(height: 8.0),
                Card(
                  elevation: 4.0,
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
                            'Give an overview of what service you offer. Tell us what are some of the '
                            'achievements you have made in your career. Describe of 500 words and above will maximise your exposure.',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'What do you provide in Spa Bath Grooming?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Obx(
                  () => DropDownMultiSelect(
                    options: petController.spaGroomingService,
                    selectedValues:
                        petController.selectedSpaGroomingService.value,
                    onChanged: (value) {
                      petController.selectedSpaGroomingService.value = value;
                      petController.selectedSpaGroomingServiceOption.value = "";

                      for (var value1
                          in petController.selectedSpaGroomingService.value) {
                        petController.selectedSpaGroomingServiceOption.value =
                            "${petController.selectedSpaGroomingServiceOption.value}$value1";
                      }
                    },
                  ),
                ),

                const SizedBox(height: 16.0),
                Card(
                  elevation: 4.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _SpapriceController,
                      validator: (value) {
                        return value!.isEmpty ? 'Enter Spa Grooming Price' : null;
                      },
                      keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        prefixText: 'Usd  ',
                        prefixStyle: TextStyle(color: Colors.black),
                        suffixText: '/session',
                        suffixStyle:
                        TextStyle(color: Colors.black, wordSpacing: 10),
                        hintText: 'Enter Spa Grooming Price',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),

                const Text(
                  'What do you provide in Basic Bath Grooming?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Obx(
                  () => DropDownMultiSelect(
                    options: petController.basicBathGroomingService,
                    selectedValues:
                        petController.selectedBasicBathGroomingService.value,
                    onChanged: (value) {
                      petController.selectedBasicBathGroomingService.value =
                          value;
                      petController
                          .selectedBasicBathGroomingServiceOption.value = "";

                      for (var value1 in petController
                          .selectedBasicBathGroomingService.value) {
                        petController
                                .selectedBasicBathGroomingServiceOption.value =
                            "${petController.selectedBasicBathGroomingServiceOption.value}$value1";
                      }
                    },
                  ),
                ),

                const SizedBox(height: 16.0),
                Card(
                  elevation: 4.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _BasicpriceController,
                      validator: (value) {
                        return value!.isEmpty ? 'Enter Basic Grooming Price' : null;
                      },
                      keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        prefixText: 'Usd  ',
                        prefixStyle: TextStyle(color: Colors.black),
                        suffixText: '/session',
                        suffixStyle:
                        TextStyle(color: Colors.black, wordSpacing: 10),
                        hintText: 'Enter Basic Grooming Price',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),

                const Text(
                  'What do you provide in Full Grooming?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Obx(
                  () => DropDownMultiSelect(
                    options: petController.fullGroomingService,
                    selectedValues:
                        petController.selectedFullGroomingService.value,
                    whenEmpty: 'Select Full Grooming Service',

                    onChanged: (value) {
                      petController.selectedFullGroomingService.value = value;
                      petController.selectedFullGroomingServiceOption.value =
                          "";

                      for (var value1
                          in petController.selectedFullGroomingService.value) {
                        petController.selectedFullGroomingServiceOption.value =
                            "${petController.selectedFullGroomingServiceOption.value}$value1";
                      }
                    },
                  ),
                ),

                const SizedBox(height: 16.0),
                Card(
                  elevation: 4.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _FullpriceController,
                      validator: (value) {
                        return value!.isEmpty ? 'Enter Full Grooming Price' : null;
                      },
                      keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        prefixText: 'Usd  ',
                        prefixStyle: TextStyle(color: Colors.black),
                        suffixText: '/session',
                        suffixStyle:
                        TextStyle(color: Colors.black, wordSpacing: 10),
                        hintText: 'Enter Full Grooming Price',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'What pets do you accept?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Obx(
                  () => DropDownMultiSelect(
                    options: petController.allPetTypes,
                    whenEmpty: 'eg: Dog, Cat, etc.',
                    onChanged: (value) {
                      petController.selectedPetTypes.value = value;
                      petController.selectedOption.value = "";

                      for (var value1 in petController.selectedPetTypes.value) {
                        petController.selectedOption.value =
                            "${petController.selectedOption.value}$value1"; // interpolation
                      }
                    },
                    selectedValues: petController.selectedPetTypes.value,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'How far are you willing to travel to visit a pet owner\'s home?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Obx(
                  () => DropDownMultiSelect(
                    options: petController.PetVisiting,
                    selectedValues: petController.selectPetVisit.value,
                    whenEmpty: 'eg: 5km, 10km, etc.',
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
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  'Preferred search location (optional)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                Card(
                  elevation: 4.0,
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

                const SizedBox(height: 16.0),
                const Text(
                  'Pet owner will feel more comfortable knowing what is include in this quote',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
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
                    text: 'Add Grooming Service',
                    isloading: _loading,
                    press: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _loading = true;
                        });
                        addGroomingService();
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

  Future<void> addGroomingService() async {
    // create varibale to store data
    String name = _nameServicesController.text;
    String listingSummary = _listingSummaryController.text;
    String preferredLocation = _preferredLocationController.text;
    String spagroomingprice = _SpapriceController.text;
    String basicgroomingprice = _BasicpriceController.text;
    String fullgroomingprice = _FullpriceController.text;
    String discription = _DiscriptionsController.text;

    // create list to store data
    List<String> acceptedPets = petController.selectedPetTypes.value;
    List<String> PetVisit = petController.selectPetVisit.value;

    List<String> spaGroomingService =
        petController.selectedSpaGroomingService.value;
    List<String> basicBathGroomingService =
        petController.selectedBasicBathGroomingService.value;
    List<String> fullGroomingService =
        petController.selectedFullGroomingService.value;

    if (acceptedPets.isEmpty ||
        PetVisit.isEmpty ||
        spaGroomingService.isEmpty ||
        basicBathGroomingService.isEmpty ||
        fullGroomingService.isEmpty) {
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          'Error',
          'Please Select All DropDown Fields');
      return;
    }

    // get user id
    String? uid = _auth.currentUser?.uid;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('key', '2');

    // store images in firebase storage
    _storage
        .ref()
        .child('GroomingServices/$uid/profileImg')
        .putFile(File(profileImg.toString()))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        profileImg = value;
      });
    });

    _storage
        .ref()
        .child('GroomingServices/$uid/image1')
        .putFile(File(img1.toString()))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        img1 = value;
      });
    });

    _storage
        .ref()
        .child('GroomingServices/$uid/image2')
        .putFile(File(img2.toString()))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        img2 = value;
      });
    });

    _storage
        .ref()
        .child('GroomingServices/$uid/image3')
        .putFile(File(img3.toString()))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        img3 = value;
      });
    });

    // add all data in map
    Map<String, dynamic> map = {
      'name': name,
      'listingSummary': listingSummary,
      'preferredLocation': preferredLocation,
      'discription': discription,
      'spaprice': spagroomingprice,
      'basicprice': basicgroomingprice,
      'fullprice': fullgroomingprice,
      'spaGroomingService': spaGroomingService,
      'basicBathGroomingService': basicBathGroomingService,
      'fullGroomingService': fullGroomingService,
      'acceptedPets': acceptedPets,
      'PetVisit': PetVisit,
      'profileImg': profileImg,
      'image1': img1,
      'image2': img2,
      'image3': img3,
    };

    _nameServicesController.clear();
    _listingSummaryController.clear();
    _preferredLocationController.clear();
    _SpapriceController.clear();
    _BasicpriceController.clear();
    _FullpriceController.clear();
    _DiscriptionsController.clear();

    // add data in firebase database
    await
    _firestore
        .collection('Services')
        .doc('userId')
        .collection('GroomingServices')
        .doc(uid).set(map);
  }
}
