import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap;
  const CustomElevatedButton({super.key, required this.btnText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15), backgroundColor: Colors.black),
      onPressed: onTap,
      child:  Text(btnText),
    );
  }
}
