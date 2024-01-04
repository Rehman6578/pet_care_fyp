import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_fyp/WidgetCommon/GroomingContainer.dart';

class GroomingScreen extends StatefulWidget {
  const GroomingScreen({super.key});

  @override
  State<GroomingScreen> createState() => _GroomingScreenState();
}

class _GroomingScreenState extends State<GroomingScreen> {
  String? uid = FirebaseAuth.instance.currentUser!.uid;
  final ref =
      FirebaseDatabase.instance.ref('services').child('GroomingService');

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
              Expanded(
                child: StreamBuilder<DatabaseEvent>(
                  stream: ref.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent>snapshot) {
                    print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
                    print(snapshot.data.toString());
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      DataSnapshot dataSnapshot = snapshot.data!.snapshot;
                      List<dynamic> dataList = [];

                      // Extract data from snapshot
                      if (dataSnapshot.value != null) {
                        dynamic snapshotValue = dataSnapshot.value; // Create a local variable
                        dataList = snapshotValue.values.toList();
                      }

                      return ListView.builder(
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          final data = dataList[index];

                          print('===================================================================');
                          print(data.toString());
                          // ... build your list item using the data
                          return GroomingContainer(
                            doctorName: data[index]['name'],
                            doctorAddress: data[index]['address']['city'],
                            doctorFee: data[index]['price'],
                            doctorImage: data[index]['profileImage'],
                            doctorlocation: data[index]['preferredLocation'],
                            doctorRatings: data[index]['price'],
                            doctorSpeciality: data[index]['name'],
                          );
                           // Example using name field
                        },
                      );
                    }
                  },
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
// Expanded(
// child: StreamBuilder(
// stream: ref.onValue,
// builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
// if(!snapshot.hasData){
// return const Center(child: CircularProgressIndicator(),);
// }
// else{
// Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as dynamic;
// List<dynamic> list = [];
// list.clear();
// list= map.values.toList();
// return ListView.builder(
// itemCount: snapshot.data!.snapshot.children.length,
// itemBuilder: (context, index) {
// return GroomingContainer(
// doctorName: list[index]['name'],
// doctorAddress: list[index]['address']['city'],
// doctorFee: list[index]['price'],
// doctorImage: list[index]['profileImage'],
// doctorlocation: list[index]['preferredLocation'],
// doctorRatings: list[index]['price'],
// doctorSpeciality: list[index]['name'],
// );
// },
// );
// }
//
// },
// ),
// )