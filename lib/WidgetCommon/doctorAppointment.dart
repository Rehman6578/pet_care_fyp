import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Button.dart';
import 'IconContainer.dart';


class DocterAppointment extends StatefulWidget {
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

  DocterAppointment({super.key, 
    this.doctorName,
    this.doctorSpeciality,
    required this.doctorImage,
    this.doctorDate,
    required this.doctorStatus,
    required this.doctorRatings,
    this.doctorFee,
    this.doctorAddress,
    this.doctorAvailableTime,
    this.doctorlocation,
  });

  @override
  State<DocterAppointment> createState() => _DocterAppointmentState();
}

class _DocterAppointmentState extends State<DocterAppointment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.all(15),
      child: Container(
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
        child: Column(
          children: [
            Row(
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
                            iconData: Image.asset('assets/images/pin.png'),
                            text: widget.doctorAddress,
                          ),
                          SizedBox(
                            width: 15,
                          ),

                          iconContainer(
                              iconData:
                                  Image.asset('assets/images/wallet.png'),
                              text: widget.doctorFee)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Container(
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  children: [
                    iconContainer(
                      iconData: Image.asset('assets/images/briefcase.png'),
                      text: widget.doctorlocation,
                    ),
                    const SizedBox(height: 15),
                    iconContainer(
                      iconData: Image.asset('assets/images/clock.png'),
                      text: widget.doctorAvailableTime,
                    ),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButton(text: 'Edit', press: (){}, color: Colors.blue, textColor: Colors.white, width: Get.width * 0.4),
                RoundedButton(text: 'Cancel', press: (){}, color: Colors.grey.withOpacity(0.2), textColor: Colors.black, width: Get.width * 0.4),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildStarRating(rating) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.orange,
          size: 18.0,
        ),
      ),
    );
  }
}
