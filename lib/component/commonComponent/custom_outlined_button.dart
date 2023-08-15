import 'package:flutter/material.dart';

class CustomOutLinedButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap;
  const CustomOutLinedButton(
      {super.key, required this.btnText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          foregroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          side: const BorderSide(color: Colors.black)),
      child: Text(btnText),
    );
  }
}
