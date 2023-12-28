import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multiselect/multiselect.dart';
import 'package:pet_care_fyp/WidgetCommon/Button.dart';
import 'package:pet_care_fyp/controllers/Pets_Services/PetController.dart';

import '../../../../controllers/Image_Controller/ImageController.dart';

class AddVeterinaryService extends StatefulWidget {
  @override
  _AddVeterinaryServiceState createState() => _AddVeterinaryServiceState();
}

class _AddVeterinaryServiceState extends State<AddVeterinaryService> {

  ImagePickerController imagePickerController = Get.put(ImagePickerController());
  MultiSelectionController petController = Get.put(MultiSelectionController());

  // TextEditingController for handling input
  TextEditingController _doctorNameController = TextEditingController();
  TextEditingController _experienceController = TextEditingController();
  TextEditingController _specializationController = TextEditingController();
  TextEditingController _personalInfoController = TextEditingController();
  TextEditingController _educationController = TextEditingController();
  TextEditingController _acceptedPetsController = TextEditingController();
  TextEditingController _offeredServicesController = TextEditingController();
  TextEditingController _acceptedPetTypesController = TextEditingController();
  TextEditingController _preferredLocationController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _streetNameController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _postalCodeController = TextEditingController();

  String? selectedOption;
  RxString doctorimage = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Veterinary Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // add imageview for adding doctor image
              Obx(()=>
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
                            image: imagePickerController.doctorimagePath.value == ''
                                ?const DecorationImage(
                                    image: AssetImage('assets/images/doctor.png'))
                                : DecorationImage(
                                    image: FileImage(File(imagePickerController
                                        .doctorimagePath.value
                                        .toString())),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: InkWell(
                          onTap: () {
                            imagePickerController.getDoctorImage();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
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

              SizedBox(height: 36.0),

              Text(
                'Add lovely images of your pets:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              // add container to get three more images
              Container(
                height: Get.height * 0.1,
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(()=>
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
                              image: imagePickerController.imagePath.value == ''
                                  ?const DecorationImage(
                                      image:
                                          AssetImage('assets/images/petimage.png'))
                                  : DecorationImage(
                                      image: FileImage(File(imagePickerController
                                          .imagePath.value
                                          .toString())),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          // add shor addimage icon to add image of 20 * 20
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: InkWell(
                              onTap: () {
                                imagePickerController.getPetsImage();

                              },
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Obx(()=> Stack(
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
                              image: imagePickerController.imagePath.value == ''
                                  ? const DecorationImage(
                                      image:
                                          AssetImage('assets/images/petimage.png'))
                                  : DecorationImage(
                                      image: FileImage(File(imagePickerController
                                          .imagePath.value
                                          .toString())),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: InkWell(
                              onTap: () {
                                imagePickerController.getImage();
                              },
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(()=>
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
                              image: imagePickerController.imagePath.value == ''
                                  ?  const DecorationImage(
                                      image:
                                          AssetImage('assets/images/petimage.png'))
                                  : DecorationImage(
                                      image: FileImage(File(imagePickerController
                                          .imagePath.value
                                          .toString())),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: InkWell(
                              onTap: () {
                                imagePickerController.getImage();
                              },
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
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
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),
              // Input for Doctor's Name
              Text(
                'Doctor\'s Name:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _doctorNameController,
                decoration: InputDecoration(
                  hintText: 'Enter doctor\'s name',
                ),
              ),
              SizedBox(height: 16.0),

              // Input for Professional Experience
              Text(
                'Professional Experience:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _experienceController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter professional experience',
                ),
              ),
              SizedBox(height: 16.0),

              // Input for Specialization
              Text(
                'Specialization:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _specializationController,
                decoration: InputDecoration(
                  hintText: 'Enter specialization',
                ),
              ),
              SizedBox(height: 16.0),

              // Input for Personal Information
              Text(
                'Personal Information:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _personalInfoController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter personal information',
                ),
              ),
              SizedBox(height: 16.0),

              // Input for Education
              Text(
                'Education:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _educationController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Enter education details',
                ),
              ),
              SizedBox(height: 16.0),

              // Input for Offered Services
              Text(
                'Offered Services:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _offeredServicesController,
                decoration: InputDecoration(
                  hintText: 'Enter offered services',
                ),
              ),
              SizedBox(height: 16.0),

              // Input for Accepted Pet Types
              const Text(
                'What pets do you accept?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              // add multi select dropdown for pet selectio

              SizedBox(
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
                        petController.selectedOption.value + "" + value1;
                  }
                },
                selectedValues: petController.selectedPetTypes.value,
              ),

              const SizedBox(height: 16.0),
              const Text(
                'Size of pet you accept?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 16.0,
              ),

              DropDownMultiSelect(
                  options: petController.allPetSizes,
                  selectedValues: petController.selectedPetSizes.value,
                  whenEmpty: 'eg: 1-5kg , 15-20kg',
                  onChanged: (value) {
                    petController.selectedPetSizes.value = value;
                    petController.SizesOptions.value = "";

                    for (var value1 in petController.selectedPetSizes.value) {
                      petController.SizesOptions.value =
                          petController.SizesOptions.value + "" + value1;
                    }
                  }),
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
                    hint: Text('Yes/No'),
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
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(
                height: 16.0,
              ),
              const Text(
                'Price:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  hintText: 'Enter the price',
                ),
              ),
              SizedBox(height: 40.0),

              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Preferred Search Location:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _preferredLocationController,
                        decoration: const InputDecoration(
                          hintText: 'Enter preferred search location',
                        ),
                      ),
                      // Input for Price
                      const SizedBox(height: 16.0),
                      // Input for Street Name
                      const Text(
                        'Street Name/No:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _streetNameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter street name/number',
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      // Input for City
                      const Text(
                        'City:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _cityController,
                        decoration: const InputDecoration(
                          hintText: 'Enter city',
                        ),
                      ),
                      SizedBox(height: 16.0),

                      // Input for State
                      const Text(
                        'State:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _stateController,
                        decoration: const InputDecoration(
                          hintText: 'Enter state',
                        ),
                      ),
                      SizedBox(height: 16.0),

                      // Input for Postal Code
                      const Text(
                        'Postal Code:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _postalCodeController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Enter postal code',
                        ),
                      ),
                      SizedBox(height: 16.0),

                      // Map View
                      const Text(
                        'Location on Map:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        height: Get.height * 0.4,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),

                      const SizedBox(height: 32.0),
                    ],
                  ),
                ),
              ),
              // Input for Preferred Search Location

              const SizedBox(height: 30.0),
              // Button to Add Service
              Center(
                  child: RoundedButton(
                text: 'Add Veterinary Service',
                press: () {},
                color: Colors.lightBlue,
                textColor: Colors.white,
                width: 380,
                height: 70,
              )),
              SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }

  // Method to add the veterinary service
  void addVeterinaryService() {
    String doctorName = _doctorNameController.text;
    String experience = _experienceController.text;
    String specialization = _specializationController.text;
    String personalInfo = _personalInfoController.text;
    String education = _educationController.text;
    String acceptedPets = _acceptedPetsController.text;
    String offeredServices = _offeredServicesController.text;
    String acceptedPetTypes = _acceptedPetTypesController.text;
    String preferredLocation = _preferredLocationController.text;
    double price = double.tryParse(_priceController.text) ?? 0.0;
    String streetName = _streetNameController.text;
    String city = _cityController.text;
    String state = _stateController.text;
    String postalCode = _postalCodeController.text;

    // Perform logic to add the service to your data model or database
    // For example, you could use a Provider or Bloc pattern to manage state
    // and update the list of veterinary services in the app.

    // After adding, you might want to navigate back to the previous screen
    Navigator.pop(context);
  }
}
