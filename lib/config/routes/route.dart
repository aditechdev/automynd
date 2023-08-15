import 'package:automynd/config/routes/route_path.dart';
import 'package:automynd/screens/landingScreen/landing_screen.dart';
import 'package:automynd/screens/loginScreen/login_screen.dart';
import 'package:automynd/screens/onBoardingScreen/on_boarding_screen.dart';
import 'package:automynd/screens/signUpScreen/sign_up_screen.dart';
import 'package:automynd/screens/splashScreen/splash_screen.dart';
import 'package:automynd/screens/welcomeScreen/welcome_screen.dart';
import 'package:get/get.dart';

class ScreenRouter {
  static List<GetPage> routes = [
    // initial page
    GetPage(
      name: RoutePath.splashScreen,
      page: () => const SplashScreen(),
    ),

    // unautorised
    GetPage(
      name: RoutePath.loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: RoutePath.onBoardingScreen,
      page: () => const OnBoardingScreen(),
    ),
    GetPage(
      name: RoutePath.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: RoutePath.signUpScreen,
      page: () => const SignUpScreen(),
    ),

    // Authorised

    GetPage(
      name: RoutePath.landingScreen,
      page: () => const LandingScreen(),
    ),
  ];

  // static Route<dynamic>? generateRoute(RouteSettings settings) {
  //   // Find the route from the routes list based on the settings.name
  //   GetPage? route = routes.firstWhere(
  //     (r) => r.name == settings.name,
  //     orElse: () => GetPage(
  //         name: '/',
  //         page: () => SelectLanguageView()), // Default route if not found
  //   );
  //   return GetPageRoute(page: route.page); // Return the GetPageRoute
  // }
}
