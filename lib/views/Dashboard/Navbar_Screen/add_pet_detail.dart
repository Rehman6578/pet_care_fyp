import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/FriendlyCatController.dart';
import '../../../controllers/FriendlyDogController.dart';
import '../../../controllers/FriendlyKidsAboveTenController.dart';
import '../../../controllers/FriendlyKidsBeloweTenController.dart';
import '../../../controllers/InformationController.dart';
import '../../../controllers/views_Controllers/MicroChipController.dart';
import '../../../controllers/PureBredController.dart';
import '../../../controllers/Pets_Services/VaccinatedController.dart';

class AddPetDetail extends StatefulWidget {
  const AddPetDetail({Key? key}) : super(key: key);

  @override
  State<AddPetDetail> createState() => _AddPetDetailState();
}

class _AddPetDetailState extends State<AddPetDetail> {

  InformationController informationController = Get.put(InformationController());
  VaccinatedController vaccinatedController = Get.put(VaccinatedController());
  FriendlydogsController friendlydogsController = Get.put(FriendlydogsController());
  FriendlycatsController friendlycatsController = Get.put(FriendlycatsController());
  FriendlykidsaboveTenController friendlykidsaboveTenController = Get.put(FriendlykidsaboveTenController());
  FriendlykidsbeloveTenController friendlykidsbeloveTenController = Get.put(FriendlykidsbeloveTenController());
  MicrochippedController microchippedController = Get.put(MicrochippedController());
  PurebredController purebredController = Get.put(PurebredController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back), // Use the back arrow icon
          onPressed: () {
            // Add your navigation logic here to go back to the previous screen.
            Navigator.of(context).pop(); // Example of navigating back to the previous screen.
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
        title: const Text(
          "Add pet detail",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top:32),

          child: Column(

            children: [

              Center(
                child: Stack(
                    children: [
                      Container(
                        height:112,
                        width:112,
                        decoration:BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),

                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: AssetImage('assets/images/Circle.png'),
                            fit: BoxFit.cover,
                          ),
                        )
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 29,
                            height: 29,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: const Icon(Icons.add,
                        color: Colors.white,),
                      ))
                    ],
                  ),
              ),
              // text
              const Padding(
                padding: EdgeInsets.only(top: 32,left: 0),
                child: Text('Genral information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),),
              ),
              // pet,s name
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Pet,s name',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    // dog name
                    hintText: 'Troy',
                  ),
                ),
              ),
              //input dropdown
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: DropdownButtonFormField(
                  decoration:const InputDecoration(
                    labelText: 'Species of your pet',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    // dog name
                    hintText: 'Dog',
                  ),
                  items:const [
                    DropdownMenuItem(
                      value: 'Dog',
                      child: Text('Dog'),
                    ),
                    DropdownMenuItem(
                      value: 'Cat',
                      child: Text('Cat'),
                    ),
                    DropdownMenuItem(
                      value: 'Bird',
                      child: Text('Bird'),
                    ),

                  ],
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              // drop down arrow
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: DropdownButtonFormField(
                  decoration:const InputDecoration(
                    labelText: 'Breed',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    // dog name
                    hintText: 'Toy terrier',
                  ),
                  items:const [
                    DropdownMenuItem(
                      value: 'Labrador',
                      child: Text('Labrador'),
                    ),
                    DropdownMenuItem(
                      value: 'Pug',
                      child: Text('Pug'),
                    ),

                  ],
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: DropdownButtonFormField(
                  decoration:const InputDecoration(
                    labelText: 'Size (optional)',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    // dog name
                    hintText: 'Select',
                  ),
                  items:const [
                    DropdownMenuItem(
                      value: 'Labrador',
                      child: Text('Labrador'),
                    ),
                    DropdownMenuItem(
                      value: 'Pug',
                      child: Text('Pug'),
                    ),

                  ],
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 20,top: 16),
              child:Text(
                  "Gender  ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  )
              )
              ),
              const SizedBox(height: 16,),
              Container(
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjust alignment as needed
                    children: [
                      SizedBox(
                        width: 170,
                        child: ElevatedButton(


                          onPressed: () {
                            // Functionality for the first button
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Background color of the first button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center, // Center the icon and text horizontally
                            children: [
                              Icon(Icons.male, size: 32, color: Colors.white), // Add an icon to the first button
                              SizedBox(width: 8), // Add spacing between the icon and text
                              Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 170,

                        child: ElevatedButton(
                          onPressed: () {
                            // Functionality for the second button
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),// Background color of the second button
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center, // Center the icon and text horizontally
                            children: [
                              Icon(Icons.female, size: 32, color: Colors.pinkAccent), // Add an icon to the second button
                              SizedBox(width: 8), // Add spacing between the icon and text
                              Text(
                                'Female',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )






                ),
              // date of birth dropdown
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: DropdownButtonFormField(
                  decoration:const InputDecoration(
                    labelText: 'Date of birth',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    // dog name
                    hintText: 'Feb 25,2018',
                  ),
                  items:const [
                    DropdownMenuItem(
                      value: 'Labrador',
                      child: Text('Labrador'),
                    ),
                    DropdownMenuItem(
                      value: 'Pug',
                      child: Text('Feb 25,2018'),
                    ),

                  ],
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20,top:32),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Additional Information',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      )),
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 16,right: 20),
                child: Column(
                  children:[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Neutered',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                        Obx(() => Switch(value:informationController.notification.value ,onChanged: (value){
                          informationController.setNotification(value);

                        },))
                      ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Vaccinated',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                          Obx(() => Switch(value:vaccinatedController.vacine.value ,onChanged: (value){
                            vaccinatedController.setNotification(value);


                          },))
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Friendly with dogs',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                          Obx(() => Switch(value:friendlydogsController.dogs.value ,onChanged: (value){
                            friendlydogsController.setNotification(value);


                          },))
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Friendly with cats',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                          Obx(() => Switch(value:friendlycatsController.cats.value ,onChanged: (value){
                            friendlycatsController.setNotification(value);


                          },))
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Friendly with kids <10 year',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                          Obx(() => Switch(value:friendlykidsaboveTenController.aboveten.value ,onChanged: (value){
                            friendlykidsaboveTenController.setNotification(value);


                          },))
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Friendly with kids >10 year',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                          Obx(() => Switch(value:friendlykidsbeloveTenController.beloveten.value ,onChanged: (value){
                            friendlykidsbeloveTenController.setNotification(value);


                          },))
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Microchipped',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                          Obx(() => Switch(value:microchippedController.microchipped.value ,onChanged: (value){
                            microchippedController.setNotification(value);


                          },))
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Purebred',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                          Obx(() => Switch(value:purebredController.purebred.value ,onChanged: (value){
                            purebredController.setNotification(value);


                          },))
                        ]
                    ),


                  ]
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 20,top:50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text('Pet’s nursery name (optional)',style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
              )),
      ]
              ),
                ),
              const Padding(
                padding: EdgeInsets.only(left: 20,top:32),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Reminders',style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      )),
                    ]
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20,top:16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Add vaccines, haircuts, pills, estrus, etc. and\nyou will receive notifications for the next\nevent.',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                    ]
                ),
              ),

              // card /remind/add
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 120, // Set the width as needed
                      height: 170, // Set the height as needed
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: const Color(0xfff0eff8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 29,
                              height: 29,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              child: const Text(
                                'Add events', // Replace with your content
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 120, // Set the width as needed
                      height: 170, // Set the height as needed
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        color: const Color(0xfff0eff8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: ColorFiltered(
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFF4552CB), // Your custom color here
                                  BlendMode.srcIn, // This mode applies the color to the image
                                ),
                                child: Image.asset(
                                  'assets/images/vaccine_icon.png',
                                  width: 40, // Set the width
                                  height: 40, // Set the height
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              child: const Text(
                                'Measles vaccine', // Replace with your content
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 120, // Set the width as needed
                      height: 170, // Set the height as needed
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        color: const Color(0xfff0eff8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: ColorFiltered(
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFF4552CB), // Your custom color here
                                  BlendMode.srcIn, // This mode applies the color to the image
                                ),
                                child: Image.asset(
                                  'assets/images/vaccine_icon.png',
                                  width: 40, // Set the width
                                  height: 40, // Set the height
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              child: const Text(
                                'Rables vaccine', // Replace with your content
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // button sold next
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 335,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4552CB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Appointments',
            icon: Icon(Icons.watch_later_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Explore',
            icon: Icon(Icons.explore_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person_outline_outlined),
          ),
        ],
      ),


    );
  }
}
