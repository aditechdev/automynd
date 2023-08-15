import 'dart:developer';

import 'package:automynd/config/routes/route_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  // Variable
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);

    firebaseUser.bindStream(_auth.userChanges());

    // ever(firebaseUser, (callback) => _setInitialScreen());
  }

  setInitialScreen() {
    firebaseUser.value == null
        ? Get.offAllNamed(RoutePath.welcomeScreen)
        : Get.offAllNamed(RoutePath.landingScreen);
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      firebaseUser.value != null
          ? Get.offAllNamed(RoutePath.welcomeScreen)
          : Get.offAllNamed(RoutePath.landingScreen);
    } catch (e) {
      print(e);
    }
  }

  Future<void> logOut(String email, String password) async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
