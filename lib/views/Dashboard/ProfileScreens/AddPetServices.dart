import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_fyp/views/Dashboard/ProfileScreens/PetServices/BoardingSerivce.dart';
import 'package:pet_care_fyp/views/Dashboard/ProfileScreens/PetServices/TrainingSerivce.dart';
import 'PetServices/GroomingServices.dart';
import 'PetServices/VeterinaryService.dart';

class AddPetServices extends StatefulWidget {
  const AddPetServices({super.key});

  @override
  State<AddPetServices> createState() => _AddPetServicesState();
}

class _AddPetServicesState extends State<AddPetServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Pet Services'),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.only(left: 8,right: 8,top: 5),
              child: InkWell(
                onTap: () {
                  Get.to(AddVeterinaryService());
                },
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    leading: Image.asset('assets/images/vet.png'),
                    title: const Text(' Veterinary Service'),
                    subtitle: const Text('Available all the time'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),


            // add services like pet grooming,pet boarding, pet walking, pet taxi, pet training
            Padding (
              padding: const EdgeInsets.only(left: 8,right: 8,top: 5),
              child: InkWell(
                onTap: () {
                  Get.to(AddGroomingService());
                },
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    leading: Image.asset('assets/images/grooming.png'),
                    title: const Text(' Grooming Service'),
                    subtitle: const Text('Available all the time'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8,top: 5),
              child: InkWell(
                onTap: () {
                  Get.to(const BoardingService());
                },
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    leading: Image.asset('assets/images/petboarding.png'),
                    title: const Text(' Boarding Service'),
                    subtitle: const Text('Available all the time'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 8,right: 8,top: 5),
              child: InkWell(
                onTap: () {},
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    leading: Image.asset('assets/images/petadoption.png'),
                    title: Text(' Adoption Service'),
                    subtitle: Text('Avaliable all the time'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
           
            Padding(
              padding: EdgeInsets.only(right: 8,left: 8,top: 5),
              child: InkWell(
                onTap: () {},
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    leading: Image.asset('assets/images/dogwalking.png'),
                    title: Text(' Walking Service'),
                    subtitle: Text('Avaliable all the time'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 8,right: 8,top: 5),
              child: InkWell(
                onTap: () {
                  Get.to(()=>TrainingSerivce());
                },
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    leading: Image.asset('assets/images/pettraining.png'),
                    title: Text(' Training Service'),
                    subtitle: Text('Avaliable all the time'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 8,right: 8,top: 5),
              child: InkWell(
                onTap: () {
                  // Get.to(()=>AddTaxiServices());
                },
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    leading: Image.asset('assets/images/pettaxi.png'),
                    title: Text(' Taxi Service'),
                    subtitle: Text('Avaliable all the time'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 8,right: 8,top: 5),
              child: InkWell(
                onTap: () {
                  // Get.to(()=>AddDatingServices());
                },
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    leading: Image.asset('assets/images/petdate.png'),
                    title: Text(' Dating Service'),
                    subtitle: Text('Avaliable all the time'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
