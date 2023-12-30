import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:pet_care_fyp/WidgetCommon/Button.dart';
import 'package:pet_care_fyp/controllers/Image_Controller/ImageController.dart';
import 'package:pet_care_fyp/controllers/Pets_Services/PetController.dart';

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
  ImagePickerController imagePickerController = Get.put(ImagePickerController());

  final _formKey = GlobalKey<FormState>();

  String? selectedYear;
  String? selectedTrainingpets;

  String? profileImg, img1, img2, img3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training Service',style: TextStyle(fontWeight: FontWeight.bold),),
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
                              img3= await  imagePickerController.GetImage();
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
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
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
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
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
                Obx(() =>  DropDownMultiSelect(
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
                )),
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
                      items: petController.years.map((option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedYear = value!;
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
                DropDownMultiSelect(
                    whenEmpty:
                    'eg: Basic Obedience training, Behavioral Training',
                    options: petController.petTrainingCourse,
                    selectedValues: petController.selectedTrainingCourse,
                    onChanged: (Value) {
                      petController.selectedTrainingCourse.value = Value;
                      petController.selectedTrainingCourseOption.value = "";

                      for (var value1
                      in petController.selectedTrainingCourse.value) {
                        petController.selectedTrainingCourseOption.value =
                        "${petController.selectedTrainingCourseOption.value}$value1";
                      }
                    }),
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
                          selectedTrainingpets = value!;
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
                DropDownMultiSelect(
                    whenEmpty: 'eg: Private/Group dog training lessons',
                    options: petController.petTrainingClasses,
                    selectedValues: petController.selectedTrainingClasses,
                    onChanged: (Value) {
                      petController.selectedTrainingClasses.value = Value;
                      petController.selectedTrainingClassesOption.value = "";

                      for (var value2
                          in petController.selectedTrainingClasses.value) {
                        petController.selectedTrainingClassesOption.value =
                            "${petController.selectedTrainingClassesOption.value}$value2";
                      }
                    }),
                // add textfield for price
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'What is your price per session?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
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
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 40),

                Center(
                  child: RoundedButton(
                    text: 'Add Service',
                    press: () {
                      if (_formKey.currentState!.validate()) {
                        Get.snackbar('Success', 'Service Added Successfully');
                        Get.to(AddLocation());
                      }
                    },
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    width: Get.width * 0.9,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
