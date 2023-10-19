import 'package:geolocation/screens/home_screen/home_page.dart';
import 'package:geolocation/screens/login/login_view.dart';
import 'package:geolocation/screens/splash_screen/splash_screen.dart';
import 'package:geolocation/screens/visitor_information/add_visitor/add_visitor_view.dart';
import 'package:geolocation/screens/visitor_information/list_visitor/list_visitor_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),

    MaterialRoute(page: HomePage),
    MaterialRoute(page: LoginViewScreen),
    MaterialRoute(page: VisitorList),
    MaterialRoute(page: AddVisitor),

    // DetailedFarmerScreen
  ],
  dependencies: [
    Singleton(classType: NavigationService),
  ],
)
class App {
  //empty class, will be filled after code generation
}
// flutter pub run build_runner build --delete-conflicting-outputs
