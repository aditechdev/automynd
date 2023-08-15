import 'package:automynd/firebase_options.dart';
import 'package:automynd/main.dart';
import 'package:automynd/repository/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppInIt {
  static initialiseApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform)

      .then((value) => Get.put(AuthRepository())

      );
    } catch (e) {
      print(e);
    }
    runApp(const MyApp());
  }
}
