import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomGridItem extends StatelessWidget {
  final String title;
  final String assetImagePath;
  final Function() onPressed;

  const CustomGridItem({super.key,
    required this.title,
    required this.assetImagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 88,
        height: 88,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.0),
          // add outer shado to the container
          boxShadow: [
            BoxShadow(
              // add shadow color with low opacity to the container for white color
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 15,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              assetImagePath, // Path to the asset image
              height: 35.0,
              width: 40.0,
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(
                fontSize: 13.0,
                // fontWeight: FontWeight.bold,
                fontFamily: 'Encode Sans',
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
