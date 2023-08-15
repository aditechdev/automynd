import 'package:flutter/material.dart';

class SplashScreenBottomTextComponent extends StatelessWidget {
  const SplashScreenBottomTextComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Made for doctor by engineer with ❤️",
      style: TextStyle(fontFamily: "Allura", fontSize: 15),
    );
  }
}
