
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_fyp/WidgetCommon/Button.dart';
import 'Login.dart';
 
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final emailController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/forgot.png'),
                  height: 150,
                  width: 150,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Please enter your email address. You will receive a link to create a new password via email.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,

                  decoration: const InputDecoration(
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundedButton(
                    text: 'Send Email',
                    press: (){
                      if(!emailController.text.toString().contains('@') || !emailController.text.toString().contains('.')){
                        Get.snackbar('Error', 'Please enter a valid email address');
                        return null;
                      }
                      auth.sendPasswordResetEmail(email: emailController.text.toString())
                      .then((value) => Get.snackbar('Success',
                          'We have sent you a password reset link on your email address.'))
                          .onError((error, stackTrace) => Get.snackbar('Error', 'Failed to send email'));
                      emailController.clear();
                      Get.to(() => const Login());
                    },
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    width: double.infinity,
                        )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
