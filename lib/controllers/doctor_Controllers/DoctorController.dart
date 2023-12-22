// doctor_controller.dart
import 'package:get/get.dart';

import '../../Utils/Models/Doctor.dart';

class DoctorController extends GetxController {
  var selectedDate = DateTime.now().obs;
  final RxList<Doctor> doctors = <Doctor>[].obs;


  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
  }

  Future<void> fetchDoctors() async {
    // Implement API call or local storage retrieval for doctors
    // Replace with your actual data fetching logic
    doctors.value = [
      Doctor(
        id: "1",
        firstName: "Alice",
        lastName: "Smith",
        specialization: "Veterinarian",
        clinicName: "Pet Care Clinic",
        email: "alice.smith@petcareclinic.com",
        phoneNumber: "+1234567890",
        bio: "Experienced veterinarian with over 5 years of experience in small animal care.",
        experience: 5,
        fee: 150.0,
        location: "Pet Care Clinic, 123 Main Street, City",

      ),

    ];
  }
  List<Doctor> filteredDoctors(String? specialization, String? clinic) {
    if (specialization != null && clinic != null) {
      return doctors.where((doctor) =>
      doctor.specialization == specialization && doctor.clinicName == clinic).toList();
    } else if (specialization != null) {
      return doctors.where((doctor) => doctor.specialization == specialization).toList();
    } else if (clinic != null) {
      return doctors.where((doctor) => doctor.clinicName == clinic).toList();
    } else {
      return doctors;
    }
  }


}
