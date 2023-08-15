import 'package:automynd/config/routes/route_path.dart';
import 'package:automynd/screens/splashScreen/splash_screen.dart';
import 'package:get/get.dart';

class ScreenRouter {
  static List<GetPage> routes = [
    GetPage(name: RoutePath.splashScreen, page: () => const SplashScreen()),
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
