

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:multiselect/multiselect.dart';
import 'package:pet_care_fyp/WidgetCommon/Button.dart';
import 'package:pet_care_fyp/const/images.dart';
import 'package:pet_care_fyp/controllers/Pets_Services/PetController.dart';

import '../../../../controllers/Image_Controller/ImageController.dart';

class AddGroomingService extends StatefulWidget {
  @override
  _AddGroomingServiceState createState() => _AddGroomingServiceState();
}

class _AddGroomingServiceState extends State<AddGroomingService> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Veterinary Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  'What pets do you accept?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                DropDownMultiSelect(
                  validator: (value) {
                    return value!.isEmpty
                        ? 'Select Option'
                        : '';
                  },
                  options: petController.allPetTypes,
                  onChanged: (value) {
                    petController.selectedPetTypes.value = value;
                    petController.selectedOption.value = "";

                    for (var value1 in petController.selectedPetTypes.value) {
                      petController.selectedOption.value =
                      "${petController.selectedOption
                          .value}$value1"; // interpolation
                    }
                  },
                  selectedValues: petController.selectedPetTypes.value,
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
                        hintText: 'Pet Grooming ',
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
                      controller: _priceController,
                      validator: (value) {
                        return value!.isEmpty
                            ? 'Enter Price'
                            : null;
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: true),
                      decoration: const InputDecoration(
                        prefixText: 'USD',
                        prefixStyle: TextStyle(color: Colors.black, wordSpacing: 10),
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
