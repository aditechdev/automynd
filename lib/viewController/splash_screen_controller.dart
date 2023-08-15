import 'dart:async';
import 'package:automynd/config/routes/route_path.dart';
import 'package:automynd/viewController/system_controller.dart';
import 'package:get/get.dart';

class SplashBloc {
  final _splashDelay = 3;

  /// Navigate to Screen after 3 seconds
  splashDelayWidget() async {
    systemController.disableStatusBar();
    var duration = Duration(seconds: _splashDelay);
    return Timer(duration, () {
      _navigationPage();
    });
  }

  void _navigationPage() {
    Get.offAndToNamed(RoutePath.loginScreen);
    systemController.enableStatusBar();
  }
}

SplashBloc splashScreenController = SplashBloc();
