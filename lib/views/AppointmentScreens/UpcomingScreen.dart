import 'package:flutter/material.dart';

import '../../WidgetCommon/doctorAppointment.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        child:  Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: ListView(
            children: [
              DocterAppointment(doctorImage: Image.asset('assets/images/doctor.png'),doctorName: 'Alekseenko Vasily ',doctorSpeciality: 'Vaterinary Dentist',doctorDate: '12/10/2021', doctorStatus: 'Yes',doctorAddress: '1.5 km',doctorlocation: 'Veterinary clinic "Alden-Vet"',doctorAvailableTime: 'Wed 9 Sep - 11:00 AM',doctorFee: '440',doctorRatings: 5),
              DocterAppointment(doctorImage: Image.asset('assets/images/doctor.png'),doctorName: 'Alekseenko Vasily ',doctorSpeciality: 'Vaterinary Dentist',doctorDate: '12/10/2021', doctorStatus: 'Yes',doctorAddress: '1.5 km',doctorlocation: 'Veterinary clinic "Alden-Vet"',doctorAvailableTime: 'Wed 9 Sep - 11:00 AM',doctorFee: '440',doctorRatings: 5),
              DocterAppointment(doctorImage: Image.asset('assets/images/doctor.png'),doctorName: 'Alekseenko Vasily ',doctorSpeciality: 'Vaterinary Dentist',doctorDate: '12/10/2021', doctorStatus: 'Yes',doctorAddress: '1.5 km',doctorlocation: 'Veterinary clinic "Alden-Vet"',doctorAvailableTime: 'Wed 9 Sep - 11:00 AM',doctorFee: '440',doctorRatings: 5),
              DocterAppointment(doctorImage: Image.asset('assets/images/doctor.png'),doctorName: 'Alekseenko Vasily ',doctorSpeciality: 'Vaterinary Dentist',doctorDate: '12/10/2021', doctorStatus: 'Yes',doctorAddress: '1.5 km',doctorlocation: 'Veterinary clinic "Alden-Vet"',doctorAvailableTime: 'Wed 9 Sep - 11:00 AM',doctorFee: '440',doctorRatings: 5),
              DocterAppointment(doctorImage: Image.asset('assets/images/doctor.png'),doctorName: 'Alekseenko Vasily ',doctorSpeciality: 'Vaterinary Dentist',doctorDate: '12/10/2021', doctorStatus: 'Yes',doctorAddress: '1.5 km',doctorlocation: 'Veterinary clinic "Alden-Vet"',doctorAvailableTime: 'Wed 9 Sep - 11:00 AM',doctorFee: '440',doctorRatings: 5),
              DocterAppointment(doctorImage: Image.asset('assets/images/doctor.png'),doctorName: 'Alekseenko Vasily ',doctorSpeciality: 'Vaterinary Dentist',doctorDate: '12/10/2021', doctorStatus: 'Yes',doctorAddress: '1.5 km',doctorlocation: 'Veterinary clinic "Alden-Vet"',doctorAvailableTime: 'Wed 9 Sep - 11:00 AM',doctorFee: '440',doctorRatings: 5),
              DocterAppointment(doctorImage: Image.asset('assets/images/doctor.png'),doctorName: 'Alekseenko Vasily ',doctorSpeciality: 'Vaterinary Dentist',doctorDate: '12/10/2021', doctorStatus: 'Yes',doctorAddress: '1.5 km',doctorlocation: 'Veterinary clinic "Alden-Vet"',doctorAvailableTime: 'Wed 9 Sep - 11:00 AM',doctorFee: '440',doctorRatings: 5),
              DocterAppointment(doctorImage: Image.asset('assets/images/doctor.png'),doctorName: 'Alekseenko Vasily ',doctorSpeciality: 'Vaterinary Dentist',doctorDate: '12/10/2021', doctorStatus: 'Yes',doctorAddress: '1.5 km',doctorlocation: 'Veterinary clinic "Alden-Vet"',doctorAvailableTime: 'Wed 9 Sep - 11:00 AM',doctorFee: '440',doctorRatings: 5),
              DocterAppointment(doctorImage: Image.asset('assets/images/doctor.png'),doctorName: 'Alekseenko Vasily ',doctorSpeciality: 'Vaterinary Dentist',doctorDate: '12/10/2021', doctorStatus: 'Yes',doctorAddress: '1.5 km',doctorlocation: 'Veterinary clinic "Alden-Vet"',doctorAvailableTime: 'Wed 9 Sep - 11:00 AM',doctorFee: '440',doctorRatings: 5),
            ],
          ),
        ),
      ),
    );
  }
}
