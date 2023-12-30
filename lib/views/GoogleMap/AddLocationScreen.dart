import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pet_care_fyp/WidgetCommon/Button.dart';
import 'package:pet_care_fyp/const/ApiKey.dart';
import 'package:pet_care_fyp/views/GoogleMap/LocationListTile.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class AddLocation extends StatefulWidget {
  const AddLocation({super.key});

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  TextEditingController search_Controller = TextEditingController();
  TextEditingController aptsuit_Controller = TextEditingController();
  TextEditingController city_Controller = TextEditingController();
  TextEditingController street_Controller = TextEditingController();
  TextEditingController state_Controller = TextEditingController();
  TextEditingController postalcode_Controller = TextEditingController();

  static const _intialCameraPosition = CameraPosition(
    target: LatLng(34.004331, 71.503790),
    zoom: 11.5,
  );

  // 34.004331, 71.503790
  final Completer<GoogleMapController> googleMaapController = Completer();
  Marker? _origion;
  Marker? _distination;

  Future<Position> _getCurrentLocation() async {
    // if permisson is granted then get current location

    await Geolocator.requestPermission().then((value) {}, onError: (error) {
      print(error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  // create set of markers for map

  final List<Marker> markers = [];

  var uuid = Uuid();
  String sessionToken = '122343';
  List<dynamic> placesList = [];

  @override
  void initState() {
    super.initState();

    search_Controller.addListener(() {
      onchange();
    });
  }

  void onchange() {
    if (sessionToken == null) {
      setState(() {
        sessionToken = uuid.v4();
      });
    }

    getSuggestion(search_Controller.text);
  }

  getSuggestion(String input) async {

    String kPLACES_API_KEY = 'AIzaSyCPGGTzDcSDX77pcz00YnnpbHkoJTND3P0';

    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$sessionToken';
    var response = await http.get(Uri.parse(request));


    print(response.body.toString());
    if (response.statusCode == 200) {
      setState(() {
        placesList = jsonDecode(response.body.toString())['predictions'];
      });
    } else {
      throw Exception('Failed to load suggestion');
    }
  }

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
              const Text(
                'Listing Location',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Pet parents will only get your full address once they have booked a resservice with you.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(
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

              ListView.builder(
                shrinkWrap: true,
                itemCount: placesList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.location_on_outlined),
                    title: Text(placesList[index]['description']),
                    onTap: () async {
                      search_Controller.text = placesList[index]['description'];
                      List<Location> location= await locationFromAddress(placesList[index]['description']);
                      //  go to the selected location on map
                      markers.add(
                        Marker(
                          markerId: const MarkerId('search location'),
                          infoWindow:
                              const InfoWindow(title: 'Your search location'),
                          position: LatLng(location[0].latitude, location[0].longitude),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueRed,
                          ),
                        ),
                      );

                      CameraPosition position = CameraPosition(
                        target: LatLng(location[0].latitude, location[0].longitude),
                        zoom: 14,
                      );

                      final GoogleMapController controller =
                          await googleMaapController.future;

                      controller.animateCamera(
                          CameraUpdate.newCameraPosition(position));

                      setState(() async {

                        // get city name from selected location
                        List<Placemark> placemarks = await placemarkFromCoordinates(location[0].latitude, location[0].longitude);
                        // get aptitude from selected location
                        String apt = placemarks[0].subThoroughfare.toString();
                        String city = placemarks[0].locality.toString();
                        String street = placemarks[0].street.toString();
                        String state = placemarks[0].administrativeArea.toString();
                        String postalCode = placemarks[0].postalCode.toString();

                        aptsuit_Controller.text = apt;
                        city_Controller.text = city;
                        street_Controller.text = street;
                        state_Controller.text = state;
                        postalcode_Controller.text = postalCode;

                        placesList = [];


                      });
                    },
                  );
                },
              ),

              Card(
                elevation: 5,
                child: InkWell(
                  onTap: () {
                    _getCurrentLocation().then((value) async {
                      markers.add(
                        Marker(
                          markerId: const MarkerId('current'),
                          infoWindow:
                              const InfoWindow(title: 'Current Location'),
                          position: LatLng(value.latitude, value.longitude),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueGreen,
                          ),
                        ),
                      );

                      CameraPosition position = CameraPosition(
                        target: LatLng(value.latitude, value.longitude),
                        zoom: 14,
                      );
                      final GoogleMapController controller =
                          await googleMaapController.future;

                      controller.animateCamera(
                          CameraUpdate.newCameraPosition(position));

                      setState(() {});
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // add icon for location and text get current location
                        Icon(Icons.location_on_outlined),
                        Text(
                          'Get Current Location',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        ),
                      ],
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
              Card(
                elevation: 5,
                color: Colors.white,
                child: SizedBox(
                  height: 400,
                  width: Get.width,
                  child: GoogleMap(
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    zoomControlsEnabled: true,
                    zoomGesturesEnabled: true,
                    initialCameraPosition: _intialCameraPosition,
                    onMapCreated: (controller) {
                      googleMaapController.complete(controller);
                    },
                   markers: Set<Marker>.of(markers),

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
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _addMarker(LatLng pos) {
    setState(() {
      if (_origion == null || (_origion != null && _distination != null)) {
        _origion = Marker(
          markerId: const MarkerId('origion'),
          infoWindow: const InfoWindow(title: 'Origon'),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
          position: pos,
        );
        _distination = null;
      } else {
        _distination = Marker(
          markerId: const MarkerId('distination'),
          infoWindow: const InfoWindow(title: 'Distination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueRed,
          ),
          position: pos,
        );
      }
    });
  }
}
