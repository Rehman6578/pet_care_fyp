// pet_taxi_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/Pets_Services/PetTaxiController.dart';

class PetTaxiScreen extends StatelessWidget {
  final PetTaxiController _controller = Get.put(PetTaxiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Taxi Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Date:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Obx(() => Text(
              _controller.bookingDate.value.toString(),
              style: TextStyle(fontSize: 16.0),
            )),
            SizedBox(height: 16.0),
            Text(
              'Driver Information:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Obx(() => Text(
              _controller.driverInfo.value,
              style: TextStyle(fontSize: 16.0),
            )),
            SizedBox(height: 16.0),
            Text(
              'Vehicle Information:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Obx(() => Text(
              _controller.vehicleInfo.value,
              style: TextStyle(fontSize: 16.0),
            )),
            SizedBox(height: 16.0),
            Text(
              'GPS Tracking Enabled:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Obx(() => Text(
              _controller.isGpsTrackingEnabled.value ? 'Yes' : 'No',
              style: TextStyle(fontSize: 16.0),
            )),
            SizedBox(height: 16.0),
            Text(
              'Emergency Contact:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Obx(() => Text(
              _controller.emergencyContact.value,
              style: TextStyle(fontSize: 16.0),
            )),
            SizedBox(height: 16.0),
            Text(
              'Special Instructions:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Obx(() => Text(
              _controller.specialInstructions.value,
              style: TextStyle(fontSize: 16.0),
            )),
          ],
        ),
      ),
    );
  }
}
