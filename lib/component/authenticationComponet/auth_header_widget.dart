import 'package:automynd/utils/empty_box_utils.dart';
import 'package:flutter/material.dart';

class AuthHeaderWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final double imageHeight;
  const AuthHeaderWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          height: imageHeight,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        verticatSpace(10),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            // fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
