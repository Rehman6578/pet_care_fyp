import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_fyp/Utils/utils.dart';
import '../../Services/google_Services.dart';
import '../../WidgetCommon/Button.dart';
import '../../WidgetCommon/My_Text_Field.dart';
import '../../controllers/auth_Controllers/SignupController.dart';
import '../Dashboard/Navbar_Screen/HomeNavbar.dart';
import 'Login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // add controller for textfield here

  bool _loading = false;

  final controller = Get.put(SignupController());
  final formkey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance.collection('users');


  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();


  @override
  void dispose() {
    usernameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

// how to assign the value of the textfield to the controller

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Stack(
            children: [
              // add back arrow button here
              const Image(
                image: AssetImage('assets/images/Background.png'),
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 100, left: 30),
                child: Text(
                  'Registration\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 45,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 500),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const Flexible(
                        fit: FlexFit.loose,
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(top: 150),
                          child: Text(
                            'Or Continue with',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      // add  circular button here in Row widget in center of the screen for facebook and google and add only icons in buttons
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // add facebook button here
                            Flexible(
                              fit: FlexFit.loose,
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    minimumSize: const Size(60, 60),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.facebook,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            // add google button here
                            Flexible(
                              fit: FlexFit.loose,
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: ElevatedButton(
                                  onPressed: () {
                                        () => AuthServices().signInWithGoogle();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    minimumSize: const Size(60, 60),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.g_mobiledata,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // add login text here below the buttons
                      Flexible(
                        fit: FlexFit.loose,
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // using GetX navigation goto LoginScreen
                                  Get.to(() => Login());
                                },
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.only(top: 200, left: 30, right: 30),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        MyTextFormField(
                          myController: usernameController,
                          focusNode: usernameFocusNode,
                          onFieldSubmittedValue: (newValue) {},
                          onValidator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Name';
                            }
                          },
                          keyBoardType: TextInputType.name,
                          hintText: 'Enter Username ',
                          labelText: 'Full name',
                          obscureText: false,
                          hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        MyTextFormField(
                          myController: emailController,
                          focusNode: emailFocusNode,
                          onFieldSubmittedValue: (newValue) {},
                          onValidator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Email ';
                            }
                          },
                          keyBoardType: TextInputType.emailAddress,
                          hintText: 'Email Address ',
                          labelText: 'Email',
                          suffixIcon: false,
                          hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                          obscureText: false,
                        ),
                        MyTextFormField(
                          myController: passwordController,
                          focusNode: passwordFocusNode,
                          onFieldSubmittedValue: (newValue) {},
                          onValidator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password ';
                            }
                          },
                          keyBoardType: TextInputType.visiblePassword,
                          hintText: 'Password ',
                          labelText: 'Password',
                          obscureText: true,
                          suffixIcon: true,
                          hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 5, left: 20, right: 20),
                          child: Row(
                            children: [
                              Checkbox(
                                value: false,
                                shape: const CircleBorder(),
                                onChanged: (value) {
                                  value = true;
                                },
                              ),
                              const Text(
                                'Agree with the rules',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // check box for do not want to recive the news
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 0, left: 20, right: 20),
                          child: Row(
                            children: [
                              Checkbox(
                                shape: const CircleBorder(),
                                value: false,
                                onChanged: (value) {},
                              ),
                              const Text(
                                'I do not want to recive the newsletter',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: RoundedButton(
                              text: 'Sign Up',
                              isloading: _loading,
                              press: (){
                                if (formkey.currentState!.validate()) {
                                  setState(() {
                                    _loading = true;
                                  });
                                  _Registration();
                                }
                              },
                              color: Colors.blue,
                              textColor: Colors.white,
                              width: Get.width * 0.8,
                              height: 70),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void _Registration() {
    if (formkey.currentState!.validate()) {
      setState(() {
        _loading = true;
      });
      _auth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      ).then((value) {
        String uid = DateTime
            .now()
            .microsecondsSinceEpoch
            .toString();
        _firestore.doc(uid).set({
          'name': usernameController.text.toString(),
          'email': emailController.text.toString(),
          'password': passwordController.text.toString(),
          'uid': uid,
        });
        emailController.clear();
        passwordController.clear();
        usernameController.clear();

        ToastMessage().showSnackBar('User Registered Successfully');
        Get.to(Login());
        setState(() {
          _loading = false;
        });
      }).onError((error, stackTrace) {
        ToastMessage().showSnackBar(error.toString());
        setState(() {
          _loading = false;
        });
      });
    }
  }
}
