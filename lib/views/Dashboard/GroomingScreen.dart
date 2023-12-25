import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../Utils/Models/GroomingService.dart';
import '../../controllers/Pets_Services/GroomingController.dart';

class GroomingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final controller = Get.lazyPut(() => GroomingController());
    // final controller = Get.find<GroomingController>();
    final controller = Get.put(GroomingController());
    // give network permission

    return Scaffold(
      appBar: AppBar(
        title: Text("Pet Grooming"),
      ),
      body: Obx(
        () =>
        controller.services.isEmpty
            ? Center(child: CircularProgressIndicator())
            :
        GridView.builder(
                padding: EdgeInsets.all(16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                ),
                itemCount: controller.services.length,
                itemBuilder: (context, index) {
                  final service = controller.services[index];
                  return GroomingCard(
                    service: service,
                    onTap: () => controller.onServiceTap(service),
                  );
                },
              ),
      ),
    );
  }
}

class GroomingCard extends StatelessWidget {
  final GroomingService service;
  final VoidCallback? onTap;

  const GroomingCard({
    required this.service,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.network(
                service.imageUrl,
                // imageUrl: service.imageUrl,
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 8.0),
              Text(
                service.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.0),
              Text(
                service.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text(service.rating.toString(),
                      style: TextStyle(fontSize: 12.0)),
                  Spacer(),
                  Text(
                    "${service.duration} - ${service.price.toString()} PKR",
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
