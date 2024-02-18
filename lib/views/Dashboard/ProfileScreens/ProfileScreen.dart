import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care_fyp/views/Dashboard/ProfileScreens/UpdateProfile.dart';
import '../../../WidgetCommon/profile_listitems.dart';
import '../../auth_screens/LoginScreen.dart';
import 'AddPetServices.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  String name = '';
  String image = '';
  String email = '';

  Future<void> fetchData() async {
    String? uid = auth.currentUser?.uid;
    print(uid);
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      DocumentSnapshot documentSnapshot = await users.doc(uid).get();

      Map<String, dynamic>? userData =
          documentSnapshot.data() as Map<String, dynamic>?;
      if (userData != null) {
        setState(() {
          name = userData['name'];
          image = userData['image'];
          email = userData['email'];
        });
      } else {
        print('User data not found.');
      }
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        //   onPressed: () {
        //     Get.back();
        //   },
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const UpdateProfile());
              },
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // Align icon and text vertically
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, right: 10.0),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ], // Ensure minimum space
                // Add padding: EdgeInsets.all(0) to remove any extra padding/margin
              ),
            ),
          ),
        ],
        title: const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Encode Sans',
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 266,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 5.0), // shadow direction: bottom right
                  )
                ],
              ),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Container(
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
                              image: image.isNotEmpty
                                  ? DecorationImage(
                                      image: NetworkImage(image),
                                      fit: BoxFit.cover,
                                    )
                                  : const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Ellipse.png'),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      name.isNotEmpty ? name : 'Maria Martinez',
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Encode Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      email.isNotEmpty
                          ? email
                          : 'Kiev', // Add your text content
                      style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Encode Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 16, // Adjust the font size
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: profile_list(
                    onTap: () {
                      // Get.to(MyPets());
                    },
                    image: Image.asset('assets/images/mypet.png'),
                    name: 'My Pets')),
            Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: profile_list(
                  onTap: () {
                    // Get.to(MyBookings());
                  },
                  image: Image.asset('assets/images/favourite.png'),
                  name: 'My Favourites',
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: profile_list(
                  onTap: () {
                    Get.to(const AddPetServices());
                  },
                  image: Image.asset('assets/images/medico.png'),
                  name: 'Add Pets Services',
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: profile_list(
                  onTap: () {
                    // Get.to(MyBookings());
                  },
                  image: Image.asset('assets/images/announcement.png'),
                  name: 'Invite Freinds',
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: profile_list(
                  onTap: () {
                    // Get.to(MyBookings());
                  },
                  image: Image.asset('assets/images/question.png'),
                  name: 'Help',
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: profile_list(
                onTap: () {
                  // Get.to(MyBookings());
                },
                image: Image.asset('assets/images/settingsgear.png'),
                name: 'Settings',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: profile_list(
                onTap: () {
                  // show here logout dialog
                  Dialog dialog = Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: SizedBox(
                      height: Get.height * 0.4,
                      child: Column(
                        children: [
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Image.asset(
                              'assets/images/love.png',
                              height: Get.height * 0.1,
                              width: Get.width * 0.2,
                            ),
                          )),
                          const Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Text(
                              'Are you sure you want to logout?',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Encode Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Text(
                              'You will be returned to the login screen',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Encode Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontFamily: 'Encode Sans',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    auth.signOut();
                                    Get.offAll(() => const LoginScreen());
                                  },
                                  child: const Text(
                                    'Logout',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontFamily: 'Encode Sans',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                  showDialog(
                    context: context,
                    builder: (BuildContext context) => dialog,
                  );
                },
                image: Image.asset('assets/images/logout1.png'),
                name: 'LogOut',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
