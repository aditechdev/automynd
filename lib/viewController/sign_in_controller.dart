import 'package:automynd/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void registerUserUsingEmailAndPassword(String email, String password) {
    AuthRepository.instance.loginUserWithEmailAndPassword(email, password);
  }
}
