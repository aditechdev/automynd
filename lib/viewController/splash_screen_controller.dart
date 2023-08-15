import 'dart:async';
import 'package:automynd/repository/auth_repository.dart';
import 'package:automynd/viewController/system_controller.dart';
import 'package:get/get.dart';

class SplashBloc {
  final _splashDelay = 3;
  final _authRepository = Get.put(AuthRepository());

  /// Navigate to Screen after 3 seconds
  splashDelayWidget() async {
    systemController.disableStatusBar();
    var duration = Duration(seconds: _splashDelay);
    return Timer(duration, () {
      _navigationPage();
    });
  }

  void _navigationPage() {
    _authRepository.setInitialScreen();
    systemController.enableStatusBar();
  }
}

SplashBloc splashScreenController = SplashBloc();
