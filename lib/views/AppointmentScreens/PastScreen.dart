import 'package:flutter/material.dart';

import '../../WidgetCommon/Button.dart';

class PastScreen extends StatefulWidget {
  const PastScreen({super.key});

  @override
  State<PastScreen> createState() => _PastScreenState();
}

class _PastScreenState extends State<PastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[100],
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            const Icon(Icons.watch_later, size: 150, color: Colors.grey),
            const Text('No Past Appointments',
                style: TextStyle(fontSize: 20, color: Colors.grey)),
            Padding(
                padding: const EdgeInsets.only(top: 300),
                child: RoundedButton(
                    text: 'Find a specialist',
                    press: () {},
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    width: 300)),
          ],
        ),
      ),
    );
  }
}
