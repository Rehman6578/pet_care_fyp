import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_fyp/Utils/Models/GroomingService.dart';
import 'package:pet_care_fyp/WidgetCommon/GroomingContainer.dart';
import 'package:pet_care_fyp/const/images.dart';
import 'package:pet_care_fyp/controllers/Pets_Services/GroomingController.dart';
import 'package:pet_care_fyp/views/SearchScreens/veterinarydoctor_card_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroomingScreen extends StatefulWidget {
  const GroomingScreen({super.key});

  @override
  State<GroomingScreen> createState() => _GroomingScreenState();
}

class _GroomingScreenState extends State<GroomingScreen> {
  String? uid = FirebaseAuth.instance.currentUser!.uid;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference collectionReference = FirebaseFirestore.instance
      .collection('Services')
      .doc('userId')
      .collection('GroomingServices');

  GroomingController groomingController = Get.put(GroomingController());

  FirebaseStorage storage = FirebaseStorage.instance;
  String profileImg = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Container(
                  width: Get.width,
                  height: Get.height * 0.2,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 100),
                            child: Text(
                              'Pet Grooming',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // add shor description for pet grooming
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                        child: Text(
                          'Pet grooming refers to both the hygienic care and cleaning of a pet, as well as a process by which a pet\'s physical appearance is enhanced for showing or other types of competition.',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // show the data from database
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Services')
                      .doc('userId')
                      .collection('GroomingServices')
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    print(
                        '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
                    print('doctor image is: ');
                    print(profileImg);
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (ctx, index) => GroomingContainer(
                        doctorName: snapshot.data!.docs[index]['name'],
                        doctorSpeciality: snapshot.data!.docs[index]
                            ['discription'],
                        doctorImage: snapshot.data!.docs[index]['profileImg'],
                        doctorFee: snapshot.data!.docs[index]['basicprice'],
                        doctorAddress: snapshot.data!.docs[index]['address']
                            ['city'],
                        doctorlocation: snapshot.data!.docs[index]['address']
                            ['state'],
                        onTap: () {
                          final selectedIndex = index;
                          final selectedSnapshotData = snapshot.data!.docs[selectedIndex];
                          groomingController.selectedData.value = selectedSnapshotData as Map<String, dynamic>; // Store in controller
                          Get.to(VeterinaryDocScreen());
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
