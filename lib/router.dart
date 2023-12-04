import 'package:geolocation/qr_code_scanner.dart';
import 'package:geolocation/screens/Event/add_event/add_event_view.dart';
import 'package:geolocation/screens/Event/list_event/list_event_view.dart';
import 'package:geolocation/screens/Session_Default/add_session_view.dart';
import 'package:geolocation/screens/TLC_Gift_Information/Tlc_Gift_Scanner.dart';

import 'package:geolocation/screens/Team_Member/add_team_member/add_team_view.dart';
import 'package:geolocation/screens/Team_Member/list_team_member/list_member_view.dart';
import 'package:geolocation/screens/designation/list_designation_view.dart';
import 'package:geolocation/screens/home_screen/home_page.dart';
import 'package:geolocation/screens/login/login_view.dart';
import 'package:geolocation/screens/product_screen/add_product_screen/add_product_view.dart';
import 'package:geolocation/screens/product_screen/list_product_screen/list_product_view.dart';
import 'package:geolocation/screens/splash_screen/splash_screen.dart';
import 'package:geolocation/screens/visitor%20attendence%20/add_visitor_attendence/visitor_attendence_scanner.dart';
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
    MaterialRoute(page: AddTeamMember),
    MaterialRoute(page: TeamMemberList),
    MaterialRoute(page: ListDesignation),
    MaterialRoute(page: AddProductScreen),
    MaterialRoute(page: AddEventScreen),
    MaterialRoute(page: ProductList),
    MaterialRoute(page: ListEventView),
    MaterialRoute(page: SessionDefault),
    MaterialRoute(page: QRCodeScanner),
    MaterialRoute(page: AttendenceScanner),
    MaterialRoute(page: TlcGiftScanner),

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
