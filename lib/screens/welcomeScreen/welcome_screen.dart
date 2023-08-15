import 'package:automynd/component/commonComponent/custom_elevated_button.dart';
import 'package:automynd/component/commonComponent/custom_outlined_button.dart';
import 'package:automynd/const/resource.dart';
import 'package:automynd/utils/empty_box_utils.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            R.ASSETS_IMAGE_WELCOME_SCREEN_PNG,
            height: height * 0.6,
          ),
          Column(
            children: [
              const Text(
                "Welcome to the app",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              verticatSpace(20),
              const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  // fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: CustomOutLinedButton(btnText: "Login", onTap: () {})),
              horizontalSpace(20),
              Expanded(
                  child: CustomElevatedButton(btnText: "SignUp", onTap: () {}))
            ],
          ),
          verticatSpace(50),
        ],
      ),
    ));
  }
}
