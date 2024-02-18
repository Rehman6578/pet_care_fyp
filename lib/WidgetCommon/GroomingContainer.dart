import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'IconContainer.dart';

class GroomingContainer extends StatefulWidget {
  // create variables for doctors appointment
  var doctorName;
  var doctorSpeciality;
  String doctorImage;
  var doctorFee;
  var doctorAddress;
  var doctorlocation;
  // add click function for doctor appointment
  Function()? onTap;

  GroomingContainer(
      {required this.doctorName,
      required this.doctorSpeciality,
      required this.doctorImage,
      required this.doctorFee,
      required this.doctorAddress,
      required this.doctorlocation,
      this.onTap,
      super.key});

  @override
  State<GroomingContainer> createState() => _GroomingContainerState();
}

class _GroomingContainerState extends State<GroomingContainer> {
  @override
  Widget build(BuildContext context) {
    print(widget.doctorImage);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
      child: GestureDetector(
        onTap: () {
          // GroomingController groomingController = Get.find();
          // groomingController.setSelectedData({
          //   'name': widget.doctorName,
          //   'discription': widget.doctorSpeciality,
          //   'profileImg': widget.doctorImage,
          //   'basicprice': widget.doctorFee,
          //   'city': widget.doctorAddress,
          //   'state': widget.doctorlocation,
          // });
          widget.onTap!();
        },
        child: Container(
          width: Get.width,
          height: Get.height * 0.16,
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
                padding: const EdgeInsets.only(left: 10, top: 15),
                child: Container(
                  height: Get.height * 0.11,
                  width: Get.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(widget.doctorImage.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.doctorName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        widget.doctorSpeciality,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(height: 10),
                        _buildStarRating(5),
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
                        Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: iconContainer(
                                iconData:
                                    Image.asset('assets/images/wallet.png'),
                                text: widget.doctorFee))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
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
