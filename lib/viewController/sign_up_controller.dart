import 'package:automynd/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void registerUserUsingEmailAndPassword(String email, String password) {
    AuthRepository.instance.createUserWithEmailAndPassword(email, password);
  }
}
