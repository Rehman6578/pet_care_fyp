import 'package:cloud_firestore/cloud_firestore.dart';

class MyGroomingDataModel {
  final List<String> petVisit;
  final List<String> acceptedPets;
  final Address address;
  final List<String> basicBathGroomingService;
  final String basicPrice;
  final String description;
  final List<String> fullGroomingService;
  final String fullPrice;
  final String image1;
  final String image2;
  final String image3;
  final String listingSummary;
  final String name;
  final String preferredLocation;
  final String profileImg;
  final List<String> spaGroomingService;
  final String spaprice;

  MyGroomingDataModel({
    required this.petVisit,
    required this.acceptedPets,
    required this.address,
    required this.basicBathGroomingService,
    required this.basicPrice,
    required this.description,
    required this.fullGroomingService,
    required this.fullPrice,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.listingSummary,
    required this.name,
    required this.preferredLocation,
    required this.profileImg,
    required this.spaGroomingService,
    required this.spaprice,
  });

  factory MyGroomingDataModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return MyGroomingDataModel(
      petVisit: List<String>.from(data['petVisit'] ?? []),
      acceptedPets: List<String>.from(data['acceptedPets'] ?? []),
      address: Address.fromMap(data['address'] ?? {}),
      basicBathGroomingService:
          List<String>.from(data['basicBathGroomingService'] ?? []),
      basicPrice: data['basicprice'] ?? 0,
      description: data['description'] ?? '',
      fullGroomingService: List<String>.from(data['fullGroomingService'] ?? []),
      fullPrice: data['fullprice'] ?? 0,
      image1: data['image1'] ?? '',
      image2: data['image2'] ?? '',
      image3: data['image3'] ?? '',
      listingSummary: data['listingSummary'] ?? '',
      name: data['name'] ?? '',
      preferredLocation: data['preferredLocation'] ?? '',
      profileImg: data['profileImg'] ?? '',
      spaGroomingService: List<String>.from(data['spaGroomingService'] ?? []),
      spaprice: data['spaprice'] ?? '',
    );
  }
}

class Address {
  final String address;
  final String apt;
  final String city;
  final String latitude;
  final String longitude;
  final String postalCode;
  final String state;
  final String street;

  Address({
    required this.address,
    required this.apt,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.postalCode,
    required this.state,
    required this.street,
  });

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      address: map['address'] ?? '',
      apt: map['apt'] ?? '',
      city: map['city'] ?? '',
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
      postalCode: map['postalCode'] ?? '',
      state: map['state'] ?? '',
      street: map['street'] ?? '',
    );
  }
}
