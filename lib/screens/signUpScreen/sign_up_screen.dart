import 'package:automynd/component/authenticationComponet/auth_header_widget.dart';
import 'package:automynd/component/authenticationComponet/sign_up_form_component.dart';
import 'package:automynd/component/commonComponent/custom_text_form_filed.dart';
import 'package:automynd/const/resource.dart';
import 'package:automynd/utils/empty_box_utils.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthHeaderWidget(
                image: R.ASSETS_IMAGE_SIGN_UP_IMAGE_PNG,
                title: "Get Onboard",
                subtitle: "Create your profile and start your journey",
                imageHeight: size.height * 0.3,
              ),
              const SignUpFormComponent(),
            ],
          ),
        ),
      )),
    );
  }
}
