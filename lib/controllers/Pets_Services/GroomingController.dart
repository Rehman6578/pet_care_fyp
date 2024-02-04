import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../Utils/Models/Doctor.dart';
import '../../Utils/Models/GroomingService.dart';
import '../../views/AppointmentScreens/AppointmentScreen.dart';

class GroomingController extends GetxController {
  final RxList<GroomingService> services = RxList<GroomingService>();


  final dataList = RxList<GroomingService>();

  // variable to hold selected data
  var selectedData = Map<String, dynamic>().obs;
  void setSelectedData(Map<String, dynamic> data) {
    selectedData = data.obs;

    // Assuming you want to track the selected index
    var selectedIndex = 0.obs;

    // Function to set the selected index
    void setSelectedIndex(int index) {
      selectedIndex.value = index;
    }

    RxString serviceName = ''.obs;
    RxString serviceSpeciality = ''.obs;
    Rx<Image> serviceImage = Image
        .asset('assets/images/doctor.png')
        .obs;
    RxInt serviceFee = 0.0.obs as RxInt;
    RxString serviceAddress = ''.obs;
    RxString servicelocation = ''.obs;


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
}
