import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class profile_list extends StatelessWidget {

  FirebaseAuth auth = FirebaseAuth.instance;

  // add required attributes to the constructor
  Image image;
  String name;
  VoidCallback onTap;
  profile_list({super.key, required this.image, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            onTap: onTap,
            leading: CircleAvatar(backgroundColor: Colors.blue.shade100,radius: 25, child: image),
            title: Text(name,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            trailing: const Icon(Icons.arrow_forward_ios)

        ),
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
          child: SizedBox(height: 1,width: double.infinity,child:Container(
            color: Colors.grey.shade300,
          ),),
        )
      ],


    );
  }
}