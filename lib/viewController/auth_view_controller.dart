import 'package:automynd/config/routes/route_path.dart';
import 'package:get/get.dart';

class AuthViewController {
  signIn() {
    navigateTOLandingPage();
  }

  signUp() {
    navigateTOLandingPage();
  }

  navigateTOLandingPage() {
    Get.offAndToNamed(RoutePath.landingScreen);
  }
}

AuthViewController authViewController = AuthViewController();
