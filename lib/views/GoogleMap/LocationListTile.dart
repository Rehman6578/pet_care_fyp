import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationListTile extends StatelessWidget {
  const LocationListTile(
      {required this.location, required this.onTap, super.key});

  final String location;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            location,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: onTap,
          horizontalTitleGap: 0.0,
          leading: const Icon(Icons.location_on_outlined),
        ),
        const Divider(
          height: 2.0,
          thickness: 2.0,
        ),
      ],
    );
  }
}
