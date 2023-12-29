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

  RxList<String> selectedPetTypes = RxList<String>([]);
  var selectedOption = ''.obs;

  // create list of pet sizes

  List<String> allPetSizes = [
    '1-5kg',
    '5-10kg',
    '10-15kg',
    '15-20kg',
    '20-25kg',
    '25-30kg',
    '30-35kg',
    '35-40kg',
  ];
  RxList<String> selectedPetSizes = RxList<String>([]);
  var SizesOptions = ''.obs;


  // list of pets time duration

  List<String> walkDuration = [
    '30 minutes',
    '1 hour',
  ];
  RxList<String> selectedWalkDuration = RxList<String>([]);
  var selectedWalkTime = ''.obs;



  // list of options

  List<String> options = [
    'Yes',
    'No',
  ];

  // list of year in pet buisness

  List<String> years = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

  //add 6 option for pet training course
  List<String> petTrainingCourse = [
    'Basic Obedience training',
    'Behavioral Training',
    'puppy Training',
    'Therapy Dog Training',
    'Trick Training',
    'Potty Training',
  ];

  RxList<String> selectedTrainingCourse = RxList<String>([]);
  var selectedTrainingCourseOption = ''.obs;

  // create list of pet training classes course
  List<String> petTrainingClasses = [
    'Private dog training lessons',
    'Group dog training lessons',
    'Board and train programs',
  ];

  RxList<String> selectedTrainingClasses = RxList<String>([]);
  var selectedTrainingClassesOption = ''.obs;

  // add list of walking services
  List<String> walkingServices = [
    '0',
    '1',
    '2',
    '3+',
  ];

  RxList<String> selectedWalkingServices = RxList<String>([]);
  var selectedWalkingServicesOption = ''.obs;

  // add list of describe the home you live in
  List<String> describeHome = [
    'Apartment',
    'House',
    'Farm',
    'Other',
  ];

  RxList<String> selectedDescribeHome = RxList<String>([]);
  var selectedDescribeHomeOption = ''.obs;

  // create pets sleeping at night
  List<String> petsSleepingAtNight = [
    'In my bed',
    'In a crate',
    'In a dog bed',
    'In a dog house',
    'In a kennel',
    'In a cage',
    'In a room',
    'Other',
  ];

  RxList<String> selectedPetsSleepingAtNight = RxList<String>([]);
  var selectedPetsSleepingAtNightOption = ''.obs;


}
