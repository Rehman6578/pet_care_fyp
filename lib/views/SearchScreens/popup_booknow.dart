import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_fyp/views/SearchScreens/veterinarydoctor_card_screen.dart';

import '../../const/colors.dart';
import '../../const/images.dart';
import '../AppointmentScreens/appointment_done.dart';

class PopupBookNowScreen extends StatelessWidget {
  const PopupBookNowScreen({super.key});

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
  DateTime dateTime = DateTime(3000,2,1,10,20);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Show the BottomSheet after the screen is rendered
      showModalBottomSheet(
        context: context,
        //isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            child: Wrap(
              children: [
                Center(child: Padding(
                  padding: const EdgeInsets.only(top: 18.0,bottom: 10, left: 13),
                  child: Row(
                    children: [
                      InkWell(
                          onTap:(){
                            //Navigator.of(context).pop();
                            Get.off(const VeterinaryDocScreen());
                          },
                          child: const Image(image: AssetImage(close))),
                      const SizedBox(width: 100,),
                      const Text(
                          "Booking confirmation",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          )
                      )
                    ],
                  ),
                )),

                Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            img1,width: 100,
                            //fit: BoxFit.cover,
                          ),
                        ),
                        const Column(
                          children: [
                            Text(
                              'Vasilenko Oksana',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Veterinary Dentist',
                              style: TextStyle(fontSize: 16),
                            ),
                            Row(
                              children: [
                                Image(image: AssetImage(star)),
                                Text('125 Reviews',style: TextStyle(color: Colors.grey),)
                              ],
                            )
                          ],
                        ),

                      ],
                    ),
                    const SizedBox(height: 30,),

                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Text('Date',style: TextStyle(color: Colors.grey,),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Text(
                                  "Wed 9 Sep",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  )
                              ),
                              SizedBox(width: 210,),
                              Icon(Icons.arrow_forward_ios_sharp,size: 15,color: Colors.grey,)
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(width: 20,),
                              Text('9:00 AM'),
                              SizedBox(width: 25,),
                              Text('9:30 AM'),
                              SizedBox(width: 25,),
                              Text('10:00 AM'),
                              SizedBox(width: 25,),
                              Text('10:30 AM'),
                              SizedBox(width: 25,),
                              Text('11:00 AM'),
                              SizedBox(width: 25,),
                              Text('11:30 AM'),
                              SizedBox(width: 25,),
                              Text('12:30 PM'),
                              SizedBox(width: 25,),
                              Text('01:00 PM'),
                              SizedBox(width: 25,),
                              Text('01:30 PM'),
                              SizedBox(width: 25,),
                              Text('02:00 PM'),
                              SizedBox(width: 25,),

                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                  ],
                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left:20),
                  child: Row(
                    children: [
                      const Column(
                        children: [
                          Row(
                              children:[
                                Image(image: AssetImage(dollar),width:30,),
                                Text(
                                    "20",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                    )
                                ),
                                Text(
                                    " / first visit",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight

                                          .w400,
                                    )
                                )
                              ]
                          ),
                        ],
                      ),
                      const SizedBox(width:50),
                      Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: Container(
                            width: 130,
                            height: 38,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xff4552cb)),
                            child: Center(
                              child: InkWell(
                                onTap:(){
                                  Get.to(const AppointmentDone());
                                },
                                child: const Text(
                                    "Book",
                                    style: TextStyle(
                                      color:white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    )
                                ),
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
              ],
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












