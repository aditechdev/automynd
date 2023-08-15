import 'package:automynd/component/commonComponent/custom_elevated_button.dart';
import 'package:automynd/component/commonComponent/custom_text_form_filed.dart';
import 'package:automynd/utils/empty_box_utils.dart';
import 'package:automynd/viewController/auth_view_controller.dart';
import 'package:flutter/material.dart';

class LoginFormComponent extends StatelessWidget {
  const LoginFormComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Form(
        child: Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        verticatSpace(20),
        const CustomTextFormField(
          label: "Email",
          hint: "youremailId@email.com",
          prefixIcon: Icon(Icons.person_outline_outlined),
          textEditingController: null,
        ),
        verticatSpace(20),
        CustomTextFormField(
          label: "Password",
          hint: "*************",
          prefixIcon: const Icon(Icons.fingerprint),
          textEditingController: null,
          obscureText: true,
          suffixIcon: IconButton(
              onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {}, child: const Text("Forget Password")),
        ),
        SizedBox(
          width: size.width,
          child: CustomElevatedButton(
            btnText: "Login",
            onTap: () => authViewController.signIn(),
          ),
        )
      ],
    ));
  }
}
