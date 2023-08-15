import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';

class SystemControler {
  /// This will show the status bar of App
  enableStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  /// This will hide the status bar of App
  disableStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  /// To display the app version
  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.version;
  }
}

SystemControler systemController = SystemControler();
