import 'package:automynd/component/authenticationComponet/login_component.dart';
import 'package:automynd/component/authenticationComponet/login_footer_component.dart';
import 'package:automynd/component/authenticationComponet/auth_header_widget.dart';
import 'package:automynd/const/resource.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthHeaderWidget(
              image: R.ASSETS_IMAGE_LOGIN_IMAGE_PNG,
              title: "Welcome back",
              subtitle: "Lorem Ipsum is simply dummy text of the",
              imageHeight: size.height * 0.4,
            ),
            const LoginFormComponent(),
            const LoginFooterComponent(),
          ],
        ),
      )),
    );
  }
}
