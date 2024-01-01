import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final double height;
  final double width;
  final bool isloading ;
  const RoundedButton({
    super.key,
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
    required this.width,
    this.height = 60,
    this.isloading = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child:  TextButton(
          style: TextButton.styleFrom(
            backgroundColor: color,
          ),
          onPressed: () => press(),
          child: Center(
            child:isloading ? const CircularProgressIndicator(color: Colors.white,strokeWidth: 3,)
                : Text( text,style: TextStyle(color: textColor,fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}


