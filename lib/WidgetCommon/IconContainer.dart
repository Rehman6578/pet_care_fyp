
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class iconContainer extends StatefulWidget {

  IconData iconData;
  final String text;

  iconContainer({required this.iconData,required this.text});

  @override
  State<iconContainer> createState() => _iconContainerState();
}

class _iconContainerState extends State<iconContainer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.withOpacity(0.2),

          ),
          child: Icon(
            widget.iconData,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width:5,
        ),
        Text(
          widget.text,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
