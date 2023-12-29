import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiselect/multiselect.dart';
import 'package:pet_care_fyp/views/GoogleMap/AddLocationScreen.dart';
import 'package:pet_care_fyp/WidgetCommon/Button.dart';
import 'package:pet_care_fyp/controllers/Image_Controller/ImageController.dart';
import 'package:pet_care_fyp/controllers/Pets_Services/PetController.dart';

class BoardingService extends StatefulWidget {
  const BoardingService({super.key});

  @override
  State<BoardingService> createState() => _BoardingServiceState();
}

ImagePickerController imagePickerController = Get.put(ImagePickerController());
MultiSelectionController petController = Get.put(MultiSelectionController());

String? selectedPets;
String? selectedWalkingServic;
String? selectedOption;
String? selectedHome;

String? profileImg, img1, img2, img3;
Uint8List? _img1, _img2, _img3;

class _BoardingServiceState extends State<BoardingService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boarding Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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

              const Text(
                'Add service name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter service name',
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Add service description',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 4,
                color: Colors.white,
                child: TextFormField(
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Give an overview of the service you offer.'
                        ' Tell us what a day look like and some fun things pets will get to do.',
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'How many pets can you watch at your home at one time?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                      '5,8,10',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey),
                    ),
                    isExpanded: true,
                    value: selectedPets,
                    borderRadius: BorderRadius.circular(10.0),
                    items: petController.years.map((option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedPets = value!;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 16),
              const Text(
                'What pets do you accept?',
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
                hint: const Text('eg: Dog, Cat, Reptile'),
                hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
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

              const SizedBox(height: 16),
              const Text(
                'Size of pet you accept?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16.0),

              DropDownMultiSelect(
                  options: petController.allPetSizes,
                  selectedValues: petController.selectedPetSizes.value,
                  hint: const Text('eg: 1-5kg, 5-10kg, 10-15kg'),
                  hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                  onChanged: (value) {
                    petController.selectedPetSizes.value = value;
                    petController.SizesOptions.value = "";

                    for (var value1 in petController.selectedPetSizes.value) {
                      petController.SizesOptions.value =
                          "${petController.SizesOptions.value}$value1";
                    }
                  }),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'What many walks can you provide per day?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                      '1,2',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    isExpanded: true,
                    value: selectedWalkingServic,
                    borderRadius: BorderRadius.circular(10.0),
                    items: petController.walkingServices.map((option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedWalkingServic = value!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
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
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
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
                height: 15,
              ),

              const Text(
                'What best describes the home you live in?',
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
                    hint: const Text('eg: Apartment, House, Farm'),
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    isExpanded: true,
                    value: selectedHome,
                    menuMaxHeight: 100,
                    borderRadius: BorderRadius.circular(10.0),
                    items: petController.describeHome.map((option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedHome = value!;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              const Text(
                'Your price per night',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter price per night',
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Center(
                child: RoundedButton(
                  text: "Next",
                  press: () {
                    Get.to(AddLocation());
                  },
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  width: Get.width * 0.9,
                  height: Get.height * 0.08,
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
