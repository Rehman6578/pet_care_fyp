
import 'package:get/get.dart';

import '../../Utils/Models/ClinicsModel.dart';
import '../../Utils/Models/Doctor.dart';


class Clinics extends GetxController {
  var selectedDate = DateTime.now().obs;
  final RxList<Clinic> clinics = <Clinic>[].obs;


  Future<void> fetchClinics() async {
    // Implement API call or local storage retrieval for clinics
    // Replace with your actual data fetching logic
    final clinicsResponse = await GetConnect().get("/clinics");
    final clinicsData = clinicsResponse.body as List<dynamic>;

    // get a list of doctors
    final doctorsResponse = await GetConnect().get("/doctors");
    final doctorsData = doctorsResponse.body as List<dynamic>;
    final doctors = doctorsData.map((doctor) => Doctor(
      id: doctor['id'],
      firstName: doctor['firstName'],
      lastName: doctor['lastName'],
      specialization: doctor['specialization'],
      clinicName: doctor['clinicName'],
      email: doctor['email'],
      phoneNumber: doctor['phoneNumber'],
      bio: doctor['bio'],
      experience: doctor['experience'],
      fee: doctor['fee'],
      location: doctor['location'],
    )).toList();


    clinics.value = clinicsData.map((clinic) => Clinic(
      id: clinic['id'],
      name: clinic['name'],
      address: clinic['address'],
      phoneNumber: clinic['phoneNumber'],
      email: clinic['email'],
      website: clinic['website'],
      description: clinic['description'],
      doctors: doctors,
      services: clinic['services'],
      location: clinic['location'],
    )).toList();
  }

}
