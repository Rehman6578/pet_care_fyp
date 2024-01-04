

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoardingTempFile extends StatefulWidget {
  const BoardingTempFile({super.key});

  @override
  State<BoardingTempFile> createState() => _BoardingTempFileState();
}

class _BoardingTempFileState extends State<BoardingTempFile> {
  @override

  final ref = FirebaseDatabase.instance.ref('services').child('GroomingService');



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boarding Temp File'),
      ),
      body:Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  return ListTile(
                    title: Text(snapshot.value.toString()),
                  );
                }
            ),
          )

        ],
      )
    );
  }
}
