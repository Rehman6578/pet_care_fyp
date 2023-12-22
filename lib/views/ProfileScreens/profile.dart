import 'package:flutter/material.dart';

import '../../WidgetCommon/Button.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController =
        TextEditingController(text: 'John Doe');
    TextEditingController emailController =
        TextEditingController(text: 'johndoe@example.com');
    TextEditingController phoneNumberController =
        TextEditingController(text: '123-456-7890');
    TextEditingController aboutMeController = TextEditingController();

    return Scaffold(
      //app bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Encode Sans',
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 112,
                      width: 112,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('assets/images/Ellipse.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 29,
                        height: 29,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Full name
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextFormField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'John Doe',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    suffixIcon: fullNameController.text.isNotEmpty
                        ? const Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : null, // Show the check icon conditionally
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 16),
                child: Text(
                  "Gender",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 170,
                      child: ElevatedButton(
                        onPressed: () {
                          // Functionality for the first button
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male, size: 32, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      child: ElevatedButton(
                        onPressed: () {
                          // Functionality for the second button
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female,
                                size: 32, color: Colors.pinkAccent),
                            SizedBox(width: 8),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Email
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'johndoe@example.com',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    suffixIcon: emailController.text.isNotEmpty
                        ? const Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : null, // Show the check icon conditionally
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextFormField(
                  // You can provide an initial value if needed
                  // controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: '123-456-7890',
                    // Example format
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    suffixIcon: phoneNumberController.text.isNotEmpty
                        ? const Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : null, // Show the check icon conditionally
                  ),
                ),
              ),
              // about me
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 16),
                child: Text(
                  "About Me",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                width: 335,
                height: 76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xfff7f7fa),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  // Add padding within the container
                  child: TextField(
                    controller: aboutMeController, // Assign the controller
                    maxLines: null, // Allow multiple lines of text
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Write about yourself...',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                    child: RoundedButton(
                  text: 'Get Started',
                  press: () {},
                  color: Colors.blue,
                  textColor: Colors.white,
                  width: 300,
                  height: 70,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
