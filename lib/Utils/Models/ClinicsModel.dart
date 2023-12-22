import 'Doctor.dart';

class Clinic {
  final String id;
  final String name;
  final String address;
  final String phoneNumber;
  final String email;
  final String website;
  final String description;
  final List<Doctor> doctors; // List of associated doctors
  final List<String> services; // List of offered services
  final String location; // City or region

  Clinic({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.website,
    required this.description,
    required this.doctors,
    required this.services,
    required this.location,
  });

  // how to return doctor list for list of doctors

}