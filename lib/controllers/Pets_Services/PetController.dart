import 'package:get/get.dart';

class MultiSelectionController extends GetxController {

  // create a list for select gender
  List<String> Gender=[
    'Male',
    "Female",
  ];

  // create a list of basic grooming service list
  List<String> spaGroomingService = [
        'Bath With Shampoo',
        'Blow Dry',
        'Nail Clipping',
        'Ear Cleaning',
        'Eyes Cleaning',
        'Paw Massage',
        'Combing/Brushing'
  ];
  RxList<String> selectedSpaGroomingService = RxList<String>([]);
  var selectedSpaGroomingServiceOption = ''.obs;

// create a list of basicBath+grooming service list
  List<String> basicBathGroomingService = [
        'Bath With Shampoo',
        'Blow Dry',
        'Nail Clipping',
        'Ear Cleaning',
        'Eyes Cleaning',
        'Paw Massage',
        'Combing/Brushing',
        'Face Haircutting',
        'Sanitary Trim',
        'Teeth Cleaning/Mouth Spray'
  ];
  RxList<String> selectedBasicBathGroomingService = RxList<String>([]);
  var selectedBasicBathGroomingServiceOption = ''.obs;

  // create a list of full grooming service list
  List<String> fullGroomingService = [
        'Bath With Shampoo',
        'Blow Dry',
        'Nail Clipping',
        'Ear Cleaning',
        'Eyes Cleaning',
        'Paw Massage',
        'Combing/Brushing',
        'Face Haircutting',
        'Sanitary Trim',
        'Teeth Cleaning/Mouth Spray',
        'Full Body Haircutting',
        'Anal Gland Expression',
        'Paw Pad Haircutting',
        'Paw Massage'
  ];
  RxList<String> selectedFullGroomingService = RxList<String>([]);
  var selectedFullGroomingServiceOption = ''.obs;

  // What type of pet do you have? List

  List<String> allPetTypes = [
    'Dog',
    'Cat',
    'Rabbit',
    'Reptile',
    'Other',
  ];
  RxList<String> selectedPetTypes = RxList<String>([]);
  var selectedOption = ''.obs;

  // Pet visiting distance from home to clinic or home to home List

  List<String> PetVisiting = [
    '1-5km',
    '5-20km',
    '20-50km',
    '50-100km',
    '100+km',
  ];
  RxList<String> selectPetVisit = RxList<String>([]);
  var selecteVisit = ''.obs;

  // do you have a dog seat belt strap ? List

  List<String> petSeatBeltList = [
    'dog seat belt strap',
    'dog crate',
    'dog carrier',
  ];
  RxList<String> selectPetseatbelt = RxList<String>([]);
  var selectePetSeatBelt = ''.obs;

  //  Pet Size List for pet walking and pet boarding services

  List<String> SelectPetSizes = [
    '1-5kg',
    '5-10kg',
    '10-15kg',
    '15-20kg',
    '20-25kg',
  ];
  RxList<String> selectedPetSize1 = RxList<String>([]);
  var selectedSize1 = ''.obs;

  // How long can you walk a dog for? List

  List<String> TimeList = [
    '30 minutes',
    '1 hour',
  ];

  List<String> options = [
    'Yes',
    'No',
  ];

  List<String> years = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  List<String> expYears = ['1', '2', '3', '4', '5', '6+'];

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
