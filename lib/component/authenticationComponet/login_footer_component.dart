import 'package:automynd/config/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFooterComponent extends StatelessWidget {
  const LoginFooterComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisAlignment: MainAxisAlignment,
      children: [
        // CustomOutLinedButton(
        //   btnText: "SignUp",
        //   onTap: () {},
        // ),
        TextButton(
            onPressed: () => Get.toNamed(RoutePath.signUpScreen),
            child: Text(
              "Don't have an account? Register",
              style: TextStyle(color: Colors.grey[400]),
            ))
      ],
    );
  }
}
