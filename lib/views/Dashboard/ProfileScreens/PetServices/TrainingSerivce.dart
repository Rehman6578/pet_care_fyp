import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:pet_care_fyp/controllers/Pets_Services/PetController.dart';

class TrainingSerivce extends StatefulWidget {
  const TrainingSerivce({super.key});

  @override
  State<TrainingSerivce> createState() => _TrainingSerivceState();
}

class _TrainingSerivceState extends State<TrainingSerivce> {

  MultiSelectionController petController = MultiSelectionController();
  String? selectedYear ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training Service'),
      ),
      body: Column(
        children: [

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
            ),
          ),
          const SizedBox(height: 10,),
          const Text(
            'Add service description',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10,),
          Card(
            elevation: 5,
            child: TextFormField(
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Give an overview of the service you offer.'
                    ' Tell us what a day look like and some fun things pets will get to do.',

              ),
            ),
          ),
          const SizedBox(height: 10,),
          const Text(
            'What pets do you train?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          // add multiselect dropdown
          const SizedBox(height: 10,),
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
          const SizedBox(height: 10,),
          const Text(
            'How many year have you been a trainer?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          // add dropdown to select year
          const SizedBox(height: 10,),
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
                value: selectedYear,
                menuMaxHeight: 100,
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
          const SizedBox(height: 10,),
          const Text(
            'What pet training course do you provide?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          DropDownMultiSelect(
              options: petController.petTrainingCourse,
              selectedValues: petController.selectedTrainingCourse,
              onChanged: (Value){
                petController.selectedTrainingCourse.value = Value;
                petController.selectedTrainingCourseOption.value = "";

                for (var value1 in petController.selectedTrainingCourse.value) {
                  petController.selectedTrainingCourseOption.value =
                      petController.selectedTrainingCourseOption.value + "" + value1;
                }
              })


        ],
      ),
    );
  }
}
