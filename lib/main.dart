import 'package:automynd/config/app_init.dart';
import 'package:automynd/config/routes/route.dart';
import 'package:automynd/config/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  AppInIt.initialiseApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutePath.splashScreen,
      getPages: ScreenRouter.routes,
    );
  }
}
