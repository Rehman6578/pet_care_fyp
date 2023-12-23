import 'package:flutter/material.dart';
import 'package:pet_care_fyp/WidgetCommon/MainContainer.dart';

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
            const Text(
              'Add Pet Services',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Image.asset('assets/images/vet.png'),
              title: Text(' Veterinary Service'),
              subtitle: Text('Avaliable all the time'),
              trailing:
                  InkWell(onTap: () {}, child: Icon(Icons.arrow_forward_ios)),
            ),
            SizedBox(
              height: 10,
            ),
            // add services like pet grooming,pet boarding, pet walking, pet taxi, pet training
            ListTile(
              leading: Image.asset('assets/images/grooming.png'),
              title: Text(' Grooming Service'),
              subtitle: Text('Avaliable all the time'),
              trailing:
                  InkWell(onTap: () {}, child: Icon(Icons.arrow_forward_ios)),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Image.asset('assets/images/petboarding.png'),
              title: Text(' Boarding Service'),
              subtitle: Text('Avaliable all the time'),
              trailing:
                  InkWell(onTap: () {}, child: Icon(Icons.arrow_forward_ios)),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Image.asset('assets/images/petadoption.png'),
              title: Text(' Adoption Service'),
              subtitle: Text('Avaliable all the time'),
              trailing:
                  InkWell(onTap: () {}, child: Icon(Icons.arrow_forward_ios)),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Image.asset('assets/images/dogwalking.png'),
              title: Text(' Walking Service'),
              subtitle: Text('Avaliable all the time'),
              trailing:
                  InkWell(onTap: () {}, child: Icon(Icons.arrow_forward_ios)),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Image.asset('assets/images/pettraining.png'),
              title: Text(' Training Service'),
              subtitle: Text('Avaliable all the time'),
              trailing:
                  InkWell(onTap: () {}, child: Icon(Icons.arrow_forward_ios)),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Image.asset('assets/images/pettaxi.png'),
              title: Text(' Taxi Service'),
              subtitle: Text('Avaliable all the time'),
              trailing:
                  InkWell(onTap: () {}, child: Icon(Icons.arrow_forward_ios)),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Image.asset('assets/images/petdate.png'),
              title: Text(' Dating Service'),
              subtitle: Text('Avaliable all the time'),
              trailing:
                  InkWell(onTap: () {}, child: Icon(Icons.arrow_forward_ios)),
            ),
          ],
        ),
      ),
    );
  }
}
