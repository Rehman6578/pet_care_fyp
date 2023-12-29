

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:multiselect/multiselect.dart';
import 'package:pet_care_fyp/WidgetCommon/Button.dart';
import 'package:pet_care_fyp/const/images.dart';
import 'package:pet_care_fyp/controllers/Pets_Services/PetController.dart';

import '../../../../controllers/Image_Controller/ImageController.dart';
import 'BoardingSerivce.dart';

class AddPetWalkingService extends StatefulWidget {
  @override
  _AddPetWalkingServiceState createState() => _AddPetWalkingServiceState();
}

class _AddPetWalkingServiceState extends State<AddPetWalkingService> {
  ImagePickerController imagePickerController =
  Get.put(ImagePickerController());

  final _formKey = GlobalKey<FormState>();


  MultiSelectionController petController = Get.put(MultiSelectionController());

  final TextEditingController _nameServicesController = TextEditingController();
  final TextEditingController _listingSummaryController = TextEditingController();
  final TextEditingController _DiscriptionsController = TextEditingController();
  final TextEditingController _preferredLocationController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _PetGroomingController = TextEditingController();
  String? selectedOption;

  String? profileImg;
  String? img1;
  String? img2;
  String? img3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Walking Service',style: TextStyle(fontWeight: FontWeight.bold),),
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
                  Container(
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
                          hintText: 'eg: Peshawar Dog Boarding',
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
                          return value!.isEmpty
                              ? 'Enter Listing Summary'
                              : null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Give an overview of what service you offer. Tell us what are some of the '
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
                    'How far are you willing to travel to visit a pet owner\'s home?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  DropDownMultiSelect(
                      validator: (value) {
                        return value!.isEmpty
                            ? 'Select Option'
                            : '';
                      },
                      options: petController.allPetSizes,
                      selectedValues: petController.selectedPetSizes.value,
                      onChanged: (value) {
                        petController.selectedPetSizes.value = value;
                        petController.SizesOptions.value = "";

                        for (var value1 in petController.selectedPetSizes.value) {
                          petController.SizesOptions.value =
                          "${petController.SizesOptions.value}$value1";
                        }
                      }),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Size of dogs you accept',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  DropDownMultiSelect(
                      validator: (value) {
                        return value!.isEmpty
                            ? 'Select Option'
                            : '';
                      },
                      options: petController.allPetSizes,
                      selectedValues: petController.selectedPetSizes.value,
                      onChanged: (value) {
                        petController.selectedPetSizes.value = value;
                        petController.SizesOptions.value = "";

                        for (var value1 in petController.selectedPetSizes.value) {
                          petController.SizesOptions.value =
                          "${petController.SizesOptions.value}$value1";
                        }
                      }),
                  const SizedBox(height: 16.0),
                  const Text(
                    'How long is each walk?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  DropDownMultiSelect(
                      validator: (value) {
                        return value!.isEmpty
                            ? 'Select Option'
                            : '';
                      },
                      options: petController.walkDuration,
                      selectedValues: petController.selectedPetSizes.value,
                      onChanged: (value) {
                        petController.selectedWalkDuration.value = value;
                        petController.selectedWalkTime.value = "";

                        for (var value1 in petController.selectedPetSizes.value) {
                          petController.SizesOptions.value =
                          "${petController.SizesOptions.value}$value1";
                        }
                      }),
                  const SizedBox(height: 16.0,),

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
                        validator: (value) {
                          return value!.isEmpty
                              ? 'Enter Preferred search location'
                              : '';
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter a landmark, key location, or area which you would like people'
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
                    elevation: 4.0,
                    color:  Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        readOnly: true,
                        controller: _PetGroomingController,
                        decoration: const InputDecoration(
                          label: Text('Services Type'),
                          hintText: 'Dog Walking ',
                          hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Card(
                    elevation: 4.0,
                    color:  Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _priceController,
                        validator: (value) {
                          return value!.isEmpty
                              ? 'Enter Price'
                              : null;
                        },
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        decoration: const InputDecoration(
                          prefixText: 'Usd',
                          prefixStyle: TextStyle(color: Colors.black),
                          suffixText: '/session',
                          suffixStyle: TextStyle(color: Colors.black,wordSpacing: 10),
                          hintText: 'Your Price',
                          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),

                   Text(
                    'Pet owner will feel more comfortable knowing what is include in this quote',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
                          return value!.isEmpty
                              ? 'Enter Description'
                              : null;
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
                        press: () {
                          if(_formKey.currentState!.validate()){
                            Get.snackbar('Success', 'Grooming Service Added Successfully');
                          };
                        },
                        color: Colors.lightBlue,
                        textColor: Colors.white,
                        width: 380,
                        height: 70,
                      )),
                  const SizedBox(height: 30.0),
                ],
              ),

            )
        ),
      ),
    );
  }
}
