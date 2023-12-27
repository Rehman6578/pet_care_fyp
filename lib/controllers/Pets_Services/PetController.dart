import 'package:get/get.dart';

class MultiSelectionController extends GetxController {
  List<String> allPetTypes = [
    'Dog',
    'Cat',
    'Bird',
    'Fish',
    'Rabbit',
    'Reptile',
    'Other',
  ];

  // Selected pet types
  RxList<String> selectedPetTypes = RxList<String>([]);
  var selectedOption = ''.obs;

  List<String> allPetSizes = [
    '1-5kg',
    '5-10kg',
    '10-15kg',
    '15-20kg',
    '20-25kg',
    '25-30kg',
  ];

  RxList<String> selectedPetSizes = RxList<String>([]);

  var SizesOptions = ''.obs;

  List<String> options = [
    'Yes',
    'No',
  ];

  List<String> years = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

  //add 6 option for pet training course
  List<String> petTrainingCourse = [
    'Basic Obedience training',
    'Behavioral Training',
    'potty Training',
    'Therapy Dog Training',
    'Trick Training',
    'Potty Training',
  ];

  RxList<String> selectedTrainingCourse = RxList<String>([]);
  var selectedTrainingCourseOption = ''.obs;

}
