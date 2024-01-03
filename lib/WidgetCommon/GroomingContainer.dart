import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'IconContainer.dart';

class GroomingContainer extends StatefulWidget {
  // create variables for doctors appointment
  var doctorName;
  var doctorSpeciality;
  final Image doctorImage;
  var doctorDate;
  String doctorStatus;
  int doctorRatings;
  var doctorFee;
  var doctorAddress;
  var doctorlocation;
  var doctorAvailableTime;

   GroomingContainer({
    required this.doctorName,
    required this.doctorSpeciality,
    required this.doctorImage,
    required this.doctorDate,
    required this.doctorStatus,
    required this.doctorRatings,
    required this.doctorFee,
    required this.doctorAddress,
    required this.doctorlocation,
    required this.doctorAvailableTime,
    super.key});

  @override
  State<GroomingContainer> createState() => _GroomingContainerState();
}

class _GroomingContainerState extends State<GroomingContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
        // color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: Container(
              height: Get.height * 0.11,
              width: Get.width  * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/images/doctor.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.doctorName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.doctorSpeciality,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(height:10),
                    _buildStarRating(widget.doctorRatings),
                    const SizedBox(width: 8.0),
                    const Text(
                      'Reviews',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // add small pin location icon circular with grey color text
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    iconContainer(
                      iconData: Icons.pin_drop_outlined,
                      text: widget.doctorAddress,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: iconContainer(
                            iconData:
                            Icons.account_balance_wallet_outlined,
                            text: widget.doctorFee))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildStarRating(int doctorRatings) {
    return Row(
      children: List.generate(
        5,
            (index) => Icon(
          index < doctorRatings ? Icons.star : Icons.star_border,
          color: Colors.orange,
          size: 18.0,
        ),
      ),
    );
  }
}
