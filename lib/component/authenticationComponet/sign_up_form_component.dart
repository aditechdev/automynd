import 'package:automynd/component/commonComponent/custom_elevated_button.dart';
import 'package:automynd/component/commonComponent/custom_text_form_filed.dart';
import 'package:automynd/config/routes/route_path.dart';
import 'package:automynd/utils/empty_box_utils.dart';
import 'package:automynd/viewController/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFormComponent extends StatelessWidget {
  const SignUpFormComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    return Column(
      children: [
        Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticatSpace(20),
                CustomTextFormField(
                    textEditingController: controller.fullNameController,
                    label: "Full Name",
                    hint: "First And Last Name",
                    prefixIcon: const Icon(Icons.person)),
                verticatSpace(20),
                CustomTextFormField(
                    textEditingController: controller.phoneNumberController,
                    label: "Phone Number",
                    hint: "9876543210",
                    prefixIcon: const Icon(Icons.phone)),
                verticatSpace(20),
                CustomTextFormField(
                    textEditingController: controller.emailController,
                    label: "Email ID",
                    hint: "email@email.com",
                    prefixIcon: const Icon(Icons.email)),
                verticatSpace(20),
                CustomTextFormField(
                  textEditingController: controller.passwordController,
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
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        SignUpController.instance
                            .registerUserUsingEmailAndPassword(
                                controller.emailController.text.trim(),
                                controller.passwordController.text.trim());
                      }
                    },
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
