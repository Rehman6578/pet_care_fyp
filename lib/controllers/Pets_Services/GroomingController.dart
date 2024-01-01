import 'package:get/get.dart';


import '../../Utils/Models/Doctor.dart';
import '../../Utils/Models/GroomingService.dart';
import '../../views/AppointmentScreens/AppointmentScreen.dart';

class GroomingController extends GetxController {
  final RxList<GroomingService> services = RxList<GroomingService>();

  Future<void> fetchServices() async {
    // Implement API call or local storage retrieval for grooming services
    // Replace with your actual data fetching logic
    services.value = [
      GroomingService(
        name: "Basic Bath & Brush",
        description: "Quick wash and fluff-up",
        imageUrl:
            "https://dogbreedersguide.com/wp-content/uploads/2018/02/very-lovely-golden-retriever-picture.jpg",
        rating: 4.8,
        duration: "30 mins",
        price: 35.00,
      ),
      GroomingService(
        name: "Full Groom",
        description: "Full grooming service",
        imageUrl:
            "https://www.pets4homes.co.uk/images/articles/4621/large/what-is-a-dog-groomer-5b1f1d0a0a0a7.jpg",
        rating: 4.9,
        duration: "1 hr",
        price: 50.00,
      ),
      GroomingService(
        name: "Nail Trim",
        description: "Trimming of nails",
        imageUrl:
            "https://www.pets4homes.co.uk/images/articles/4621/large/what-is-a-dog-groomer-5b1f1d0a0a0a7.jpg",
        rating: 4.5,
        duration: "15 mins",
        price: 15.00,
      ),
      GroomingService(
        name: "Ear Cleaning",
        description: "Cleaning of ears",
        imageUrl:
            "https://www.pets4homes.co.uk/images/articles/4621/large/what-is-a-dog-groomer-5b1f1d0a0a0a7.jpg",
        rating: 4.5,
        duration: "15 mins",
        price: 15.00,
      ),
      GroomingService(
        name: "Teeth Cleaning",
        description: "Cleaning of teeth",
        imageUrl:
            "https://www.pets4homes.co.uk/images/articles/4621/large/what-is-a-dog-groomer-5b1f1d0a0a0a7.jpg",
        rating: 4.5,
        duration: "15 mins",
        price: 15.00,
      ),
      GroomingService(
        name: "Flea Treatment",
        description: "Flea treatment",
        imageUrl:
            "https://www.pets4homes.co.uk/images/articles/4621/large/what-is-a-dog-groomer-5b1f1d0a0a0a7.jpg",
        rating: 4.5,
        duration: "15 mins",
        price: 15.00,
      ),

      // ... Add more services ...
    ];
  }

  void onServiceTap(GroomingService service) {
    // Navigate to detailed service screen using Get.to()
    // Replace with your desired navigation logic
    // Get.to(() => GroomingScreen(service: service));
  }

  var selectedDoctor = Doctor(
    id: '',
    firstName: '',
    lastName: '',
    specialization: '',
    clinicName: '',
    email: '',
    phoneNumber: '',
    bio: '',
    experience: 0,
    fee: 0.0,
    location: '',
  ).obs;

  // List of available doctors
  var availableDoctors = [
    Doctor(
      id: '1',
      firstName: 'John',
      lastName: 'Doe',
      specialization: 'Cardiologist',
      clinicName: 'HeartCare Clinic',
      email: 'john.doe@example.com',
      phoneNumber: '123-456-7890',
      bio: 'Dr. John Doe is a cardiologist with 10 years of experience.',
      experience: 10,
      fee: 150.0,
      location: 'Cardiology Wing, City Hospital',
    ),
    Doctor(
      id: '2',
      firstName: 'Jane',
      lastName: 'Smith',
      specialization: 'Dermatologist',
      clinicName: 'SkinWell Clinic',
      email: 'jane.smith@example.com',
      phoneNumber: '987-654-3210',
      bio: 'Dr. Jane Smith is a dermatologist with 8 years of experience.',
      experience: 8,
      fee: 120.0,
      location: 'Dermatology Department, City Clinic',
    ),
    // Add more doctors as needed
  ].obs;

  var doctorAppointments = <AppointmentScreen>[].obs;
}
