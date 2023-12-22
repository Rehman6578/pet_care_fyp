

import 'package:get/get.dart';

import '../../views/AppointmentScreens/AppointmentScreen.dart';

class Doctor {
  final String id;
  final String firstName;
  final String lastName;
  final String specialization;
  final String clinicName;
  final String email;
  final String phoneNumber;
  final String bio;
  final int experience; // In years
  final double fee; // Per consultation
  final String location; // Address or city

  Doctor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.specialization,
    required this.clinicName,
    required this.email,
    required this.phoneNumber,
    required this.bio,
    required this.experience,
    required this.fee,
    required this.location,
  });

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