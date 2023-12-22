import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/images.dart';
import '../Dashboard/MainDashboard.dart';

class PopupScreen extends StatelessWidget {
  const PopupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Show the BottomSheet after the screen is rendered
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              child: Wrap(
                children: [
                  Center(child: Padding(
                    padding: const EdgeInsets.only(top: 18.0,bottom: 10, left: 13),
                    child: Row(
                      children: [
                        InkWell(
                          onTap:(){
                            //Navigator.of(context).pop();
                            Get.off(const Dashboard());
                          },
                            child: const Image(image: AssetImage(close))),
                        const SizedBox(width: 90,),
                        const Text('Select a speciality',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),),
                      ],
                    ),
                  )),
                  const SizedBox(height: 24,),
                  Column(
                    children: [
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Popular specialties",
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Cat Specialist",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Dog Specialist",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Ornithologist",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Dentist",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Surgeon",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      const SizedBox(height: 20,),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "All specialties",
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 18.0),
                      //   child: Text(
                      //   "Veterinarian \nTherapist \n Anesthetist \n Gastroenterologist \n Infectious
                      //   disease \nCardiologist \nNeurologist \nOncologist \nOrnithologist \nOrthopedist
                      //   \nOphthalmologist \nRadiologist \nDentist \nTherapist \nTraumatologist \nSurgeon \nEndocrinologist \nGroomer",
                      //   style: TextStyle(
                      //   fontSize: 14,
                      //   fontWeight: FontWeight.w400,
                      //   )
                      //   ),
                      // ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Veterinarian",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Therapist",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Anesthetist",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Gastroenterologist",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Infectious disease",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Cardiologist",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Neurologist",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Ornithologist",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Orthopedist",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Dentist",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Therapist",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Traumatologist",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Surgeon",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Endocrinologist",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      ListTile(
                        onTap: (){

                        },
                        title:const Text(
                            "Groomer",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                    ],
                  ),
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
    return const Scaffold();
  }
}











