import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_fyp/controllers/Pets_Services/petBoarding_Controller.dart';

class BoardingPetsList extends StatelessWidget {
  BoardingPetsList({super.key});

  final PetBoardingController controller = Get.put(PetBoardingController());
  final PetBoardingController containerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          height: 150,
          margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 5,
                spreadRadius: 5,
              )
            ],
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      spreadRadius: 0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://th.bing.com/th/id/OIP.Qi2mS11Ml1PRAYV2cZYJAQHaHa?rs=1&pid=ImgDetMain',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // add pet name as' Pet Name: ''
                    Text(
                      'Pet Name:    ${containerController.petBoarding[index].petName}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Pet Type:  ${containerController.petBoarding[index].petType}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Pet Breed:  ${containerController.petBoarding[index].petBreed}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Owner Name:  ${containerController.petBoarding[index].ownerName}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Contact Number:  ${containerController.petBoarding[index].contactNumber}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
        // return Card(
        //   // check if list is empty then thow text 'No Pets Added Yet'
        //   child: ListTile(
        //     leading: CircleAvatar(
        //       backgroundImage: NetworkImage(
        //         'https://th.bing.com/th/id/R.422da64b5d4c9753d101857671960901?rik=APlxNPUViFhaBQ&pid=ImgRaw&r=0',
        //       ),
        //     ),
        //     title: Text(containerController.petBoarding[index].petName),
        //     subtitle: Text(containerController.petBoarding[index].petType),
        //     trailing: IconButton(
        //       icon: Icon(Icons.delete),
        //       onPressed: () {
        //         containerController.petBoarding.removeAt(index);
        //       },
        //     ),
        //   ),
        // );
      },
      // itemCount: controller.petBoarding.length,
      itemCount: containerController.petBoarding.length,
    );
  }
}
