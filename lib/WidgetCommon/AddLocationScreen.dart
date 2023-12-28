import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_fyp/WidgetCommon/Button.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({super.key});

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  final TextEditingController aptsuit_Controller = TextEditingController();
  final TextEditingController city_Controller = TextEditingController();
  final TextEditingController street_Controller = TextEditingController();
  final TextEditingController state_Controller = TextEditingController();
  final TextEditingController postalcode_Controller = TextEditingController();
  final TextEditingController search_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Location'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Listing Location',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Pet parents will only get your full address once they have booked a resservice with you.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),

              // add rounded shadow container for location

              Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextField(
                    controller: search_Controller,
                    decoration: const InputDecoration(
                      hintText: 'Tap Here To Search',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              // add line divider
              const Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey,
              ),

              const SizedBox(
                height: 15,
              ),

              Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextField(
                    controller: aptsuit_Controller,
                    decoration: const InputDecoration(
                      hintText: 'Apt/Suite, etc',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextField(
                    controller: street_Controller,
                    decoration: const InputDecoration(
                      hintText: 'Street',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextField(
                    controller: city_Controller,
                    decoration: const InputDecoration(
                      hintText: 'City',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextField(
                    controller: state_Controller,
                    decoration: const InputDecoration(
                      hintText: 'State',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextField(
                    controller: postalcode_Controller,
                    decoration: const InputDecoration(
                      hintText: 'Postal Code',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              const Text(
                'Listing Location on Map',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Drag the pin to the exact location of your listing.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(
                height: 20,
              ),

              // add container for map
              const Card(
                elevation: 5,
                color: Colors.white,
                child: SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: Center(
                    child: Text('Map'),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // add button for save location
              Center(
                child: RoundedButton(
                  text: 'Save Location',
                  press: () {},
                  textColor: Colors.white,
                  width: Get.width * 0.9,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(
                height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}