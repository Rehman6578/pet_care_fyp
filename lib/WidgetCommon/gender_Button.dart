import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  final String gender;
  final IconData icon;
  // final bool isSelected;
  final VoidCallback onTap;
  const GenderButton(
      {super.key,
      required this.gender,
      required this.icon,
      // required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    // print(isSelected);
    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: gender == 'Male'
              ? MaterialStateProperty.all<Color>(Colors.blue)
              : MaterialStateProperty.all<Color>(Colors.white),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: gender == 'Male' ? Colors.white : Colors.red,
            ),
            const SizedBox(width: 8), // Add some spacing between icon and text
            Text(
              gender,
              style: TextStyle(
                color: gender == 'Male' ? Colors.white : Colors.black,
              ),
            ),
          ],
        ));
  }
}
