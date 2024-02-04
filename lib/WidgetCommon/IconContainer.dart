
import 'package:flutter/material.dart';

class iconContainer extends StatefulWidget {

  final Image iconData;
  final String text;

  iconContainer({super.key, required this.iconData,required this.text});

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
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image(
              color: Colors.black, image: widget.iconData.image,
            ),
          ),
        ),
        const SizedBox(
          width:5,
        ),
        Text(
          widget.text,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
