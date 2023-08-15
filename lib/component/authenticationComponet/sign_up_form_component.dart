import 'package:automynd/component/commonComponent/custom_elevated_button.dart';
import 'package:automynd/component/commonComponent/custom_text_form_filed.dart';
import 'package:automynd/config/routes/route_path.dart';
import 'package:automynd/utils/empty_box_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFormComponent extends StatelessWidget {
  const SignUpFormComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticatSpace(20),
            const CustomTextFormField(
                label: "Full Name",
                hint: "First And Last Name",
                prefixIcon: Icon(Icons.person)),
            verticatSpace(20),
            const CustomTextFormField(
                label: "Phone Number",
                hint: "9876543210",
                prefixIcon: Icon(Icons.phone)),
            verticatSpace(20),
            const CustomTextFormField(
                label: "Email ID",
                hint: "email@email.com",
                prefixIcon: Icon(Icons.email)),
            verticatSpace(20),
            CustomTextFormField(
              label: "Passwod",
              hint: "*********",
              prefixIcon: const Icon(Icons.fingerprint),
              suffixIcon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
            ),
            verticatSpace(20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomElevatedButton(
                btnText: "SignUp",
                onTap: () {},
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () => Get.toNamed(RoutePath.loginScreen),
                  child: const Text("Already have account? SignIn")),
            )
          ],
        ))
      ],
    );
  }
}
