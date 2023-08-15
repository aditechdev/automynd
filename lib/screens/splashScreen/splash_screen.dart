import 'package:automynd/component/splashScreenComponent/animate_app_title_component.dart';
import 'package:automynd/component/splashScreenComponent/logo_component.dart';
import 'package:automynd/component/splashScreenComponent/splash_screen_bottom_text_component.dart';
import 'package:automynd/utils/empty_box_utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            verticatSpace(MediaQuery.of(context).size.width * 0.7),
            const Column(
              children: [
                LogoComponent(),
                // AnimatedText
                AnimatedAppNameComponent(),
              ],
            ),
            const Spacer(),
            const SplashScreenBottomTextComponent(),
            verticatSpace(20)
          ],
        ),
      ),
    );
  }
}
