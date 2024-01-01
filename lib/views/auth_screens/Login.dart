import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_fyp/Utils/utils.dart';
import '../../WidgetCommon/Button.dart';
import '../../WidgetCommon/My_Text_Field.dart';
import '../Dashboard/Navbar_Screen/HomeNavbar.dart';
import 'LoginScreen.dart';
import 'RegisterScreen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _isSecurePassword = true;

   bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  void login() async {

    setState(() {
      _loading = true;
    });
    auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text).then((value) {
          emailController.clear();
          passwordController.clear();
          ToastMessage().showSnackBar('Login Successfully');
      Get.to(const home_nav());
      setState(() {
        _loading = false;
      });
    }).onError((error, stackTrace) {

      ToastMessage().showSnackBar('Email or Password is incorrect');
      setState(() {
        _loading = false;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // devide screen using stack widget and add background image in half screen and half white background
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
                'Sign In\n',
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
                height: 500,
                width: Get.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 265,
                    width: Get.width,
                    color: Colors.white,
                    child: Expanded(
                      child: Column(
                        children: [
                          const Flexible(
                            flex: 3,
                            fit: FlexFit.loose,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 80, left: 20, right: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        color: Colors.black12,
                                        thickness: 1,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        'Or Continue with',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Divider(
                                        color: Colors.black12,
                                        thickness: 1,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          // add  circular button here in Row widget in center of the screen for facebook and google and add only icons in buttons
                          Flexible(
                            flex: 2,
                            fit: FlexFit.loose,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // add facebook button here
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        minimumSize: const Size(60, 60),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.facebook,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  // add google button here
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        minimumSize: const Size(60, 60),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.g_mobiledata,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // add login text here below the buttons
                          Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: InkWell(
                              onTap: () {
                                Get.to(const RegisterScreen());
                              },
                              child: RichText(
                                text: const TextSpan(
                                  text: 'Don\'t have an account? ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Registration',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 350,
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
                key: _formKey,
                child: Flexible(
                  flex: 3,
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          MyTextFormField(
                              myController: emailController,
                              focusNode: emailFocusNode,
                              onFieldSubmittedValue: (value) {
                                // Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
                              },
                              onValidator: (value) {
                                return value!.isEmpty
                                    ? 'Please enter your email'
                                    : null;
                              },
                              keyBoardType: TextInputType.emailAddress,
                              hintText: 'Email Address',
                              hintStyle:
                                  const TextStyle(color: Colors.blueAccent),
                              labelText: 'Email ',
                              obscureText: false,
                              suffixIcon: false,
                          ),
                          const SizedBox(height: 10),
                          MyTextFormField(
                              myController: passwordController,
                              focusNode: passwordFocusNode,
                              onFieldSubmittedValue: (value) {},
                              onValidator: (value) {
                                return value!.isEmpty
                                    ? 'Please enter your password'
                                    : null;
                              },
                              keyBoardType: TextInputType.visiblePassword,
                              labelText: 'Password',
                              hintText: 'Enter your Password',
                              hintStyle:
                              const TextStyle(color: Colors.blueAccent),
                              obscureText: _isSecurePassword,
                              suffixIcon: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  // using GetX navigation goto LoginScreen
                                  Get.to(() => const LoginScreen());
                                },
                                child: Text(
                                  'Do not remember the password?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        fontSize: 16,
                                        // decoration: TextDecoration.underline,
                                        color: Colors.blue[900],
                                      ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          RoundedButton(
                              text: "Sign in ",
                              isloading: _loading,
                              press: () {
                                if(_formKey.currentState!.validate()){
                                  login();
                                }
                              },
                              color: Colors.blue,
                              textColor: Colors.white,
                              height: Get.height * 0.08,
                              width: Get.width * 0.8,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget toggleButton() {

    return IconButton(onPressed: (){
      setState(() {
        _isSecurePassword = !_isSecurePassword;
      });
    }, icon: _isSecurePassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility));
  }

}
