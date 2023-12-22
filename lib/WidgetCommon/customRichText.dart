import 'package:flutter/material.dart';

class MyRichText extends StatelessWidget {
  final String mainText;
  final String subText;
  final TextStyle mainTextStyle;
  final TextStyle subTextStyle;
  // final VoidCallback onPress;

  MyRichText({
    required this.mainText,
    required this.subText,
    // this.onPress,
    this.mainTextStyle = const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    this.subTextStyle = const TextStyle(
      fontSize: 14.0,
      color: Colors.grey,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),

        child: Center(
          child: RichText(
            text: TextSpan(
              text:  mainText,
              style: mainTextStyle,
              children: [
                TextSpan(
                  text: subText,
                  style: subTextStyle,
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}