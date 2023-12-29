import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pet_care_fyp/WidgetCommon/Button.dart';
import 'package:pet_care_fyp/const/ApiKey.dart';
import 'package:pet_care_fyp/views/GoogleMap/LocatinListTile.dart';
import 'package:pet_care_fyp/views/GoogleMap/Network_Utiliti.dart';
import 'package:pet_care_fyp/views/GoogleMap/PlaceAutocompleteResponse.dart';

import 'AutoCompletePrediction.dart';

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

  static const _intialCameraPosition = CameraPosition(
    target: LatLng(34.004331, 71.503790),
    zoom: 11.5,
  );

  List<AutoCompletePrediction> predictions = [];

  void placeAutocomplete(String query) async {
    Uri uri =
        Uri.https('maps.googleapis.com', "map/api/place/autocomplete/json", {
      'key': api_key,
      'input': query,
    });

    String? response = await NetworkUtils.fetchUrl(uri);
    if (response != null) {
      PlaceAutoCompleteResponse result =
          PlaceAutoCompleteResponse.placeAutoCompleteResponse(response);
      if (result.predictions != null) {
        setState(() {
          predictions = result.predictions!;
        });
      }
    }
  }

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
                    onChanged: (value) {
                      placeAutocomplete(value);
                    },
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
                height: 10,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Row(
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

              // ListView.builder(
              //   itemCount: predictions.length,
              //   itemBuilder: (context, index) {
              //     return LocatoinListTile(
              //         location: predictions[index].description!, onTap: () {});
              //   },
              // ),

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
                  width: double.infinity,
                  child: GoogleMap(
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    zoomControlsEnabled: true,
                    mapType: MapType.normal,
                    initialCameraPosition: _intialCameraPosition,
                    onMapCreated: (controller) {
                      googleMaapController.complete(controller);
                    },
                    markers: {
                      if (_origion != null) _origion!,
                      if (_distination != null) _distination!,
                    },
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
                  press: () {
                    // firt show dialog box for save location
                    Get.defaultDialog(
                      title: 'Save Location',
                      middleText:
                          'Are you sure you want to save this location?',
                      textConfirm: 'Save',
                      textCancel: 'Cancel',
                      confirmTextColor: Colors.white,
                      cancelTextColor: Colors.black,
                      onConfirm: () {
                        // after save location go to next screen
                        Get.toNamed('/AddPetServices');
                      },
                      onCancel: () {
                        Get.back();
                      },
                    );
                  },
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
