import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_fyp/dummy.dart';
import '../../../WidgetCommon/Button.dart';
import '../../../WidgetCommon/mainContainer.dart';
import '../../../const/images.dart';
import '../../Boarding_Temp.dart';
import '../../SearchScreens/nearme_veterinary_screen.dart';
import '../GroomingScreen.dart';
import '../PetDatingScreen.dart';
import '../ProfileScreens/UpdateProfile.dart';
import 'PetTaxiScreen.dart';
import 'add_pet_detail.dart';

class home_nav extends StatefulWidget {
  const home_nav({Key? key}) : super(key: key);

  @override
  State<home_nav> createState() => _home_nav();
}

class _home_nav extends State<home_nav> {
  // final AddPetDetail _addPetDetail = Get.put(const AddPetDetail());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Show the BottomSheet after the screen is rendered
      showBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 20),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Image(image: AssetImage(close))),
                        SizedBox(
                          width: Get.width * 0.2,
                        ),
                        const Text(
                          'Add Pet Details',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ListTile(
                    leading: Image(image: AssetImage(dot)),
                    title: Text('Faster check-in at appointment.'),
                  ),
                  const ListTile(
                    leading: Image(image: AssetImage(dot)),
                    title: Text(
                        'Schedule of vaccination, haircuts, inspections etc.'),
                  ),
                  const ListTile(
                    leading: Image(image: AssetImage(dot)),
                    title:
                        Text('Reminder of the upcoming events with your pet.'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedButton(
                            text: "+ Add",
                            press: () {
                              Get.to(const AddPetDetail());
                            },
                            color: Colors.blue,
                            textColor: Colors.white,
                            width: Get.width * 0.35),
                        const SizedBox(
                          width: 20,
                        ),
                        RoundedButton(
                            text: "No,Later",
                            press: () {
                              Get.back();
                            },
                            color: Colors.grey.withOpacity(0.2),
                            textColor: Colors.black,
                            width: Get.width * 0.35),
                        SizedBox(
                          height: Get.height * 0.1,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // add search icon on right side of appbar
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // add icon for search
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      Get.to(const NearVeterinaryScreen());
                    },
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 70, left: 25, right: 15),
              child: Text('What are you looking for?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    wordSpacing: 1.9,
                    color: Colors.black,
                    fontFamily: 'Encode Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 48,
                  )),
            ),
            // use gridview to display 3 row and 3 column of contianer inside icons and text
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                children: [
                  CustomGridItem(
                      title: 'Veterinary',
                      assetImagePath: 'assets/images/vet.png',
                      onPressed: () {}),
                  CustomGridItem(
                      title: 'Grooming',
                      assetImagePath: 'assets/images/grooming.png',
                      onPressed: () {
                        Get.to(const GroomingScreen());
                      }),
                  CustomGridItem(
                      title: 'Pet boarding',
                      assetImagePath: 'assets/images/petboarding.png',
                      onPressed: () {
                        Get.to(BoardingTempFile());
                      }),
                  CustomGridItem(
                      title: 'Adoption',
                      assetImagePath: 'assets/images/petadoption.png',
                      onPressed: () {}),
                  CustomGridItem(
                      title: 'Dog walking',
                      assetImagePath: 'assets/images/dogwalking.png',
                      onPressed: () {}),
                  CustomGridItem(
                      title: 'Pet training',
                      assetImagePath: 'assets/images/pettraining.png',
                      onPressed: () {}),
                  CustomGridItem(
                      title: 'Pet Taxi',
                      assetImagePath: 'assets/images/pettaxi.png',
                      onPressed: () {
                        Get.to(PetTaxiScreen());
                      }),
                  CustomGridItem(
                      title: 'Pet Date',
                      assetImagePath: 'assets/images/petdate.png',
                      onPressed: () {
                        Get.to(PetDating());
                      }),
                  CustomGridItem(
                      title: 'Other',
                      assetImagePath: 'assets/images/other.png',
                      onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
