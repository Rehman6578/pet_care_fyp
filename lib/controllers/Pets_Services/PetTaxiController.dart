// pet_taxi_controller.dart
import 'package:get/get.dart';

class PetTaxiController extends GetxController {
  var bookingDate = DateTime.now().obs;
  var driverInfo = "John Doe".obs;
  var vehicleInfo = "Pet Taxi - ABC123".obs;
  var isGpsTrackingEnabled = false.obs;
  var emergencyContact = "123-456-7890".obs;
  var specialInstructions = "".obs;
}

