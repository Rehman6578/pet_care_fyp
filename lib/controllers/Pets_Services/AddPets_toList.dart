
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_fyp/controllers/Pets_Services/petBoarding_Controller.dart';

import '../../WidgetCommon/Button.dart';
import '../../WidgetCommon/My_Text_Field.dart';


class AddPets_toList extends StatelessWidget {
  AddPets_toList({super.key});

  final PetBoardingController controller = Get.put(PetBoardingController());

  final PetBoardingController containerController = Get.find();

  TextEditingController petname = TextEditingController();
  TextEditingController pettype = TextEditingController();
  TextEditingController petbreed = TextEditingController();
  TextEditingController ownername = TextEditingController();
  TextEditingController contactnumber = TextEditingController();

  final Petname = FocusNode();
  final petType = FocusNode();
  final petBreed = FocusNode();
  final ownerName = FocusNode();
  final contactNumber = FocusNode();

  final formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Add your Pet for Boarding',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Container(
              width: double.infinity - 15,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: ()  {

                    },
                    iconSize: 50,
                    icon: const Icon(Icons.add),
                  ),
                  const Text(
                    'Add Image',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Form(
              key: formkey,
              child: Column(children: [
                MyTextFormField(
                  myController: petname,
                  focusNode: Petname,
                  onFieldSubmittedValue: (value) {
                    Petname.unfocus();
                    FocusScope.of(context).requestFocus(Petname);
                  },
                  onValidator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Pet Name';
                    }
                    return null;
                  },
                  keyBoardType: TextInputType.text,
                  hintText: 'Enter Pet Name',
                  labelText: 'Pet Name',
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  obscureText: false,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 5),
                MyTextFormField(
                  myController: pettype,
                  focusNode: petType,
                  onFieldSubmittedValue: (value) {
                    petType.unfocus();
                    FocusScope.of(context).requestFocus(petBreed);
                  },
                  onValidator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Pet Type';
                    }
                    return null;
                  },
                  keyBoardType: TextInputType.text,
                  hintText: 'Enter Pet Type',
                  labelText: 'Pet Type',
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  obscureText: false,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 5),
                MyTextFormField(
                  myController: petbreed,
                  focusNode: petBreed,
                  onFieldSubmittedValue: (value) {
                    petBreed.unfocus();
                    FocusScope.of(context).requestFocus(ownerName);
                  },
                  onValidator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Pet Breed';
                    }
                    return null;
                  },
                  keyBoardType: TextInputType.text,
                  hintText: 'Enter Pet Breed',
                  labelText: 'Pet Breed',
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  obscureText: false,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 5),
                MyTextFormField(
                  myController: ownername,
                  focusNode: ownerName,
                  onFieldSubmittedValue: (value) {
                    ownerName.unfocus();
                    FocusScope.of(context).requestFocus(contactNumber);
                  },
                  onValidator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Owner Name';
                    }
                    return null;
                  },
                  keyBoardType: TextInputType.text,
                  hintText: 'Enter Owner Name',
                  labelText: 'Owner Name',
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  obscureText: false,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 5),
                MyTextFormField(
                  myController: contactnumber,
                  focusNode: contactNumber,
                  onFieldSubmittedValue: (value) {
                    contactNumber.unfocus();
                  },
                  onValidator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Contact Number';
                    }
                    return null;
                  },
                  keyBoardType: TextInputType.number,
                  hintText: 'Enter Contact Number',
                  labelText: 'Contact Number',
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  obscureText: false,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 15),
                RoundedButton(
                  text: 'Add Pet for boarding',
                  press: () {},
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  width: 250,
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

