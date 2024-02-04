import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_fyp/controllers/Pets_Services/GroomingController.dart';
import 'package:pet_care_fyp/views/SearchScreens/popup_booknow.dart';
import 'package:readmore/readmore.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Utils/Models/GroomingService.dart';
import '../../WidgetCommon/GroomingContainer.dart';
import '../../const/colors.dart';
import '../../const/images.dart';

class VeterinaryDocScreen extends StatefulWidget {
  var doctorName;
  var doctorSpeciality;
  var doctorImage;
  var doctorFee;
  var doctorAddress;
  var doctorlocation;

  VeterinaryDocScreen({
     this.doctorName,
     this.doctorImage,
     this.doctorFee,
     this.doctorSpeciality,
     this.doctorAddress,
     this.doctorlocation,
    super.key,
  });

  @override
  State<VeterinaryDocScreen> createState() => _VeterinaryDocScreenState();
}

class _VeterinaryDocScreenState extends State<VeterinaryDocScreen> {

  GroomingController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    CalendarFormat calendarFormat = CalendarFormat.month;
    DateTime focusedDay = DateTime.now();
    DateTime? selectedDay;
    final selectedData = controller.selectedData.value;

    // Use Get.arguments to retrieve the passed data
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(()=>
            Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: Image(
                      image: NetworkImage(selectedData['profileImg'].toString()),
                      fit: BoxFit.cover,
                      width: 420,
                      height: 420,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.only(top: 350, left: 5, right: 5),
                      width: Get.width,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: const Border(
                            top: BorderSide(color: white, width: 1),
                            bottom: BorderSide(color: white, width: 1),
                            right: BorderSide(color: white, width: 1),
                            left: BorderSide(color: white, width: 1)),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey, // Shadow color
                            offset: Offset(0, 1), // Offset (horizontal, vertical)
                            blurRadius: 3, // Blur radius
                            spreadRadius: 1, // Spread radius
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Vasilenko Oksana',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Veterinary Dentist',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      '10 years of experience',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                            radius: 13,
                                            child: Image(
                                              image: AssetImage(walet),
                                              width: 30,
                                            )),
                                        Text('1.5km'),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        CircleAvatar(
                                            radius: 13,
                                            child: Image(
                                              image: AssetImage(map),
                                              width: 15,
                                            )),
                                        Image(
                                          image: AssetImage(dollar),
                                          width: 15,
                                        ),
                                        Text('20'),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 90,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 64,
                                      width: 64,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: blue,
                                      ),
                                      child: const Center(
                                          child: Text('4.9',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w700))),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text("125 reviews",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                            "“He was friendly and diligent in getting to the\n right diagnosis and presciption.” ",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text("a verified review",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 10,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        const Image(image: AssetImage(fivestar)),
                        const SizedBox(
                          width: 115,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text("View all 125 reviews",
                              style: TextStyle(
                                color: blue,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              )),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //Calendar

                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: const Border(
                            top: BorderSide(color: white, width: 1),
                            bottom: BorderSide(color: white, width: 1),
                            right: BorderSide(color: white, width: 1),
                            left: BorderSide(color: white, width: 1)),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey, // Shadow color
                            offset: Offset(0, 1), // Offset (horizontal, vertical)
                            blurRadius: 3, // Blur radius
                            spreadRadius: 1, // Spread radius
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            // First Row: Months Names
                            Row(children: [
                              const CircleAvatar(
                                  radius: 10,
                                  child: Image(
                                    image: AssetImage(step),
                                    width: 15,
                                    color: blue,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _showMonthlyReminderPopup(context);
                                },
                                child: const Text("September",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 10,
                                color: Colors.grey,
                              )
                            ]),
                            const SizedBox(
                              height: 25,
                            ),
                            const SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Text('1',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('2',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('3',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('4',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('5',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('6',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('7',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('8',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('9',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('10',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('11',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('12',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('13',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('14',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('15',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('16',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('17',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('18',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('19',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('20',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('21',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('22',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('23',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('24',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('25',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('26',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('27',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('28',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('29',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('30',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text('31',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      // children: List.generate(30, (index) {
                                      //   final month = DateTime(2023, index + 1);
                                      //   return
                                      //     Text(
                                      //     month.month.toString(),
                                      //     style: TextStyle(fontWeight: FontWeight.bold,),
                                      //   );
                                      // }),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Text('Sun',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Text('Mon',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Text('Tue',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Text('Wed',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Text('Thu',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Text('Fri',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Text('Sat',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 25,
                                        ),

                                        Text('Sun',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Text('Mon',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Text('Tue',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        // Text('Wed', style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(width:25 ,),
                                        // Text('Thu', style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(width:25 ,),
                                        // Text('Fri', style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(width:25 ,),
                                        // Text('Sat', style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(width:25 ,),
                                        //
                                        // Text('Sun', style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(width:25 ,),
                                        // Text('Mon', style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(width:25 ,),
                                        // Text('Tue', style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(width:25 ,),
                                        // Text('Wed', style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(width:25 ,),
                                        // Text('Thu', style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(width:25 ,),
                                        // Text('Fri', style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(width:25 ,),
                                        // Text('Sat', style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(width:25 ,),
                                        //
                                        // Text('Sun', style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(width:25 ,),
                                        // Text('Mon', style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(width:25 ,),
                                        // Text('Tue', style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(width:25 ,),
                                        // Text('Wed', style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(width:25 ,),
                                        // Text('Thu', style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(width:125 ,),
                                        // Text('Fri', style: TextStyle(fontWeight: FontWeight.bold)),SizedBox(width:125 ,),
                                        // Text('Sat', style: TextStyle(fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 1150,
                                        ),
                                      ],
                                    ),
                                  ],
                                )),

                            // Second Row: Days Names

                            const SizedBox(
                              height: 15,
                            ),
                            // Third Row: Appointment Times
                            const SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text('9:00 AM'),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text('9:30 AM'),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text('10:00 AM'),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text('10:30 AM'),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text('11:00 AM'),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text('11:30 AM'),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text('12:30 PM'),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text('01:00 PM'),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text('01:30 PM'),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text('02:00 PM'),
                                  SizedBox(
                                    width: 25,
                                  ),
                                ],
                              ),
                            ),

                            // Here, you can add your appointment cells as needed for each day and time slot
                            // For example, you can use a GridView or ListView to display the appointments.
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Text("Biography",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(children: [
                          Text(
                              "Alekseenko Vasily Vasilyevich, born in 1974\n Master of Veterinary Medicine\n Leading doctor Veterinary clinic Alden-Vet \n Specialization: clinical diagnostics, surgery vet, dentist",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ))
                        ]),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Text("Education",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Text(
                                "Before entering the agricultural Academy he worked at\n the department of surgery of the veterinary faculty \n(1991-1992). He graduated from the Faculty of \nVeterinary Medicin of NAU in 1997. He defended his \nthesis at the Department of Surgery on the topic: Surgery\n onthe urinary organs cats. Scientific advisor prof. \nBorisevich V.B. In 1998 graduated from the Magistracy.",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Text("Professional experience",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Column(
                          children: [
                            ListTile(
                                leading: Image(image: AssetImage(dot)),
                                title: Text(
                                    "Repeated participant and winner of the International Conferences, reports on the topic: “Iatrogenic pathology in urology”, “Foreign bodies of the gastrointestinal tract in small domestic animals”",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ))),
                            ListTile(
                              leading: Image(image: AssetImage(dot)),
                              title: Text(
                                  "From 1998 to 2001, he was the chief physician of the\n Equus veterinary medicine clinic.",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                            ListTile(
                              leading: Image(image: AssetImage(dot)),
                              title: Text(
                                  "Constantly increases the level of his qualifications,\nattending international conferences, congresses,\nworkshops on veterinary services for small pets.",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                            ListTile(
                                leading: Image(image: AssetImage(dot)),
                                title: Text(
                                    "Since 2006, the leading doctor of veterinary care UCCA. \nAt the same time, she continues to conduct reception\nat the Equus veterinary medicine clinic, where he has been working since 1997.",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ))),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Text("Personal information",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Text(
                                "Candidate master of sports in equestrian sport dressage.\n Favorite breed of dog is German Shepherd. He is \nmarried, has two children: daughter Alika and son Timur.",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text("Reviews",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            )),
                        SizedBox(
                          width: 110,
                        ),
                        Text("View all 125 reviews",
                            style: TextStyle(
                              color: blue,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            )),
                        Icon(
                          Icons.keyboard_arrow_right_sharp,
                          size: 17,
                          color: blue,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Card(
                            // Adjust the card's shadow
                            child: Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        img1, width: 100,
                                        //fit: BoxFit.cover,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 18.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Vasilenko Oksana',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Image(image: AssetImage(fivestar)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 260,
                                      margin: const EdgeInsets.only(left: 20),
                                      child: const ReadMoreText(
                                        "Thank you very much! Great clinic! The \ndog was limping, X-rayed, prescribed\n quality treatment. Dog of fights!\n Excellent specialists. Yesterday we had to put our 15 year old cat Cleo to sleep. She was diagnosed with chronic kidney failure. The vet at Newport. Isle of Wight branch. Demetrios was wonderful and very supportive and caring and treated Cleo with care and respect. He explained our options and helped us to make a difficult decision. The young lady on reception, don't know her name she had long dark hair, was lovely and caring too. Thank you all at Newport Pet Doctors.",
                                        trimLines: 4,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: 'more',
                                        moreStyle: TextStyle(color: blue),
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                        trimExpandedText: 'Show less',
                                        lessStyle: TextStyle(color: blue),
                                      ),
                                    )
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 8.0, left: 8, top: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        'a verified review',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CircleAvatar(
                                          radius: 5,
                                          backgroundColor: Colors.green,
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 10,
                                          )),
                                      SizedBox(
                                        width: 110,
                                      ),
                                      Text("26.02.2019",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Card(
                            // Adjust the card's shadow
                            child: Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        img1, width: 100,
                                        //fit: BoxFit.cover,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 18.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Vasilenko Oksana',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Image(image: AssetImage(fivestar)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 260,
                                      margin: const EdgeInsets.only(left: 20),
                                      child: const ReadMoreText(
                                        "Thank you very much! Great clinic! The \ndog was limping, X-rayed, prescribed\n quality treatment. Dog of fights!\n Excellent specialists. Yesterday we had to put our 15 year old cat Cleo to sleep. She was diagnosed with chronic kidney failure. The vet at Newport. Isle of Wight branch. Demetrios was wonderful and very supportive and caring and treated Cleo with care and respect. He explained our options and helped us to make a difficult decision. The young lady on reception, don't know her name she had long dark hair, was lovely and caring too. Thank you all at Newport Pet Doctors.",
                                        trimLines: 4,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: 'more',
                                        moreStyle: TextStyle(color: blue),
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        'a verified review',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CircleAvatar(
                                          radius: 5,
                                          backgroundColor: Colors.green,
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 10,
                                          )),
                                      SizedBox(
                                        width: 110,
                                      ),
                                      Text("26.02.2019",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey, // Shadow color
                          offset: Offset(0, 1), // Offset (horizontal, vertical)
                          blurRadius: 3, // Blur radius
                          spreadRadius: 1, // Spread radius
                        ),
                      ],
                    ),
                    width: 325,
                    height: 45,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage(edit)),
                        Text("Write a Review",
                            style: TextStyle(
                              color: blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text("Nearby vet",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 340,
                            height: 175,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white),
                            child: GestureDetector(
                              onTap: () {
                                // Get.off(VeterinaryDocScreen());
                              },
                              child: Card(
                                elevation: 2, // Adjust the card's shadow
                                child: Column(
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            img1, width: 100,
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
                                                Text(
                                                  '125 Reviews',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 8.0, left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '10 years of experience',
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          CircleAvatar(
                                              child: Image(
                                            image: AssetImage(map),
                                            width: 20,
                                          )),
                                          Text('1.5km'),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          CircleAvatar(
                                              child: Image(
                                            image: AssetImage(walet),
                                            width: 30,
                                          )),
                                          Image(
                                            image: AssetImage(dollar),
                                            width: 15,
                                          ),
                                          Text('20'),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 340,
                            height: 175,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white),
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Card(
                                elevation: 2, // Adjust the card's shadow
                                child: Column(
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            img1, width: 100,
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
                                                Text(
                                                  '125 Reviews',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 8.0, left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '10 years of experience',
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          CircleAvatar(
                                              child: Image(
                                            image: AssetImage(map),
                                            width: 20,
                                          )),
                                          Text('1.5km'),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          CircleAvatar(
                                              child: Image(
                                            image: AssetImage(walet),
                                            width: 30,
                                          )),
                                          Image(
                                            image: AssetImage(dollar),
                                            width: 15,
                                          ),
                                          Text('20'),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Shadow color
                        offset: Offset(0, 2), // Offset (horizontal, vertical)
                        blurRadius: 5, // Blur radius
                        spreadRadius: 2, // Spread radius
                      ),
                    ],
                  ),
                  height: 108,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 18.0),
                          child: Column(
                            children: [
                              Row(children: [
                                Image(
                                  image: AssetImage(dollar),
                                  width: 30,
                                ),
                                Text("20",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                    )),
                                Text(" / first visit",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ]),
                              Row(
                                children: [
                                  Image(image: AssetImage(star)),
                                  Text(
                                    '125 Reviews',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 40),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, left: 5, right: 5),
                          child: Container(
                              width: 140,
                              height: 38,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: const Color(0xff4552cb)),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    Get.to(const PopupBookNowScreen());
                                  },
                                  child: const Text("Book",
                                      style: TextStyle(
                                        color: white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      )),
                                ),
                              )),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _showMonthlyReminderPopup(BuildContext context) async {
  DateTime? selectedDate = DateTime.now(); // Make it nullable

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Set Monthly Reminder'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Select a date for your monthly reminder:'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate!,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null) {
                  selectedDate = picked; // Assign the non-null value
                  // You can save the selected date and set up your reminder logic here.
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Select Date'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}

// class MapWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 200,
//       child: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: LatLng(37.42796133580664, -122.085749655962),
//           zoom: 14,  // Adjust the initial zoom level as needed
//         ),
//         markers: {
//           Marker(
//             markerId: MarkerId('1'),
//             position: LatLng(37.42796133580664, -122.085749655962),
//             infoWindow: InfoWindow(title: 'Your Location'),
//           ),
//         },
//       ),
//     );
//   }
// }

// Column(
// children: [
//
// MapWidget(),
// ],
// ),
