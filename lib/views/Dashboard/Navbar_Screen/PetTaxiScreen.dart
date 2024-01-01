// pet_taxi_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/Pets_Services/PetTaxiController.dart';

class PetTaxiScreen extends StatelessWidget {
  final PetTaxiController _controller = Get.put(PetTaxiController());

  PetTaxiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Taxi Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Booking Date:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Obx(() => Text(
              _controller.bookingDate.value.toString(),
              style: const TextStyle(fontSize: 16.0),
            )),
            const SizedBox(height: 16.0),
            const Text(
              'Driver Information:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Obx(() => Text(
              _controller.driverInfo.value,
              style: const TextStyle(fontSize: 16.0),
            )),
            const SizedBox(height: 16.0),
            const Text(
              'Vehicle Information:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Obx(() => Text(
              _controller.vehicleInfo.value,
              style: const TextStyle(fontSize: 16.0),
            )),
            const SizedBox(height: 16.0),
            const Text(
              'GPS Tracking Enabled:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Obx(() => Text(
              _controller.isGpsTrackingEnabled.value ? 'Yes' : 'No',
              style: const TextStyle(fontSize: 16.0),
            )),
            const SizedBox(height: 16.0),
            const Text(
              'Emergency Contact:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Obx(() => Text(
              _controller.emergencyContact.value,
              style: const TextStyle(fontSize: 16.0),
            )),
            const SizedBox(height: 16.0),
            const Text(
              'Special Instructions:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Obx(() => Text(
              _controller.specialInstructions.value,
              style: const TextStyle(fontSize: 16.0),
            )),
          ],
        ),
      ),
    );
  }
}
