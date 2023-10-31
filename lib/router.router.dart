// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i12;
import 'package:flutter/material.dart';
import 'package:geolocation/screens/designation/list_designation_view.dart'
    as _i9;
import 'package:geolocation/screens/home_screen/home_page.dart' as _i3;
import 'package:geolocation/screens/login/login_view.dart' as _i4;
import 'package:geolocation/screens/product_screen/add_product_screen/add_product_view.dart'
    as _i10;
import 'package:geolocation/screens/product_screen/list_product_screen/list_product_view.dart'
    as _i11;
import 'package:geolocation/screens/splash_screen/splash_screen.dart' as _i2;
import 'package:geolocation/screens/Team_Member/add_team_member/add_team_view.dart'
    as _i7;
import 'package:geolocation/screens/Team_Member/list_team_member/list_member_view.dart'
    as _i8;
import 'package:geolocation/screens/visitor_information/add_visitor/add_visitor_view.dart'
    as _i6;
import 'package:geolocation/screens/visitor_information/list_visitor/list_visitor_view.dart'
    as _i5;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i13;

class Routes {
  static const splashScreen = '/';

  static const homePage = '/home-page';

  static const loginViewScreen = '/login-view-screen';

  static const visitorList = '/visitor-list';

  static const addVisitor = '/add-visitor';

  static const addTeamMember = '/add-team-member';

  static const teamMemberList = '/team-member-list';

  static const listDesignation = '/list-designation';

  static const addProductScreen = '/add-product-screen';

  static const productList = '/product-list';

  static const all = <String>{
    splashScreen,
    homePage,
    loginViewScreen,
    visitorList,
    addVisitor,
    addTeamMember,
    teamMemberList,
    listDesignation,
    addProductScreen,
    productList,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreen,
      page: _i2.SplashScreen,
    ),
    _i1.RouteDef(
      Routes.homePage,
      page: _i3.HomePage,
    ),
    _i1.RouteDef(
      Routes.loginViewScreen,
      page: _i4.LoginViewScreen,
    ),
    _i1.RouteDef(
      Routes.visitorList,
      page: _i5.VisitorList,
    ),
    _i1.RouteDef(
      Routes.addVisitor,
      page: _i6.AddVisitor,
    ),
    _i1.RouteDef(
      Routes.addTeamMember,
      page: _i7.AddTeamMember,
    ),
    _i1.RouteDef(
      Routes.teamMemberList,
      page: _i8.TeamMemberList,
    ),
    _i1.RouteDef(
      Routes.listDesignation,
      page: _i9.ListDesignation,
    ),
    _i1.RouteDef(
      Routes.addProductScreen,
      page: _i10.AddProductScreen,
    ),
    _i1.RouteDef(
      Routes.productList,
      page: _i11.ProductList,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreen: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreen(),
        settings: data,
      );
    },
    _i3.HomePage: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.HomePage(),
        settings: data,
      );
    },
    _i4.LoginViewScreen: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginViewScreen(),
        settings: data,
      );
    },
    _i5.VisitorList: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.VisitorList(),
        settings: data,
      );
    },
    _i6.AddVisitor: (data) {
      final args = data.getArgs<AddVisitorArguments>(nullOk: false);
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.AddVisitor(key: args.key, visitorid: args.visitorid),
        settings: data,
      );
    },
    _i7.AddTeamMember: (data) {
      final args = data.getArgs<AddTeamMemberArguments>(nullOk: false);
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i7.AddTeamMember(key: args.key, memberid: args.memberid),
        settings: data,
      );
    },
    _i8.TeamMemberList: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.TeamMemberList(),
        settings: data,
      );
    },
    _i9.ListDesignation: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ListDesignation(),
        settings: data,
      );
    },
    _i10.AddProductScreen: (data) {
      final args = data.getArgs<AddProductScreenArguments>(nullOk: false);
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.AddProductScreen(key: args.key, productid: args.productid),
        settings: data,
      );
    },
    _i11.ProductList: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.ProductList(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AddVisitorArguments {
  const AddVisitorArguments({
    this.key,
    required this.visitorid,
  });

  final _i12.Key? key;

  final String visitorid;

  @override
  String toString() {
    return '{"key": "$key", "visitorid": "$visitorid"}';
  }

  @override
  bool operator ==(covariant AddVisitorArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.visitorid == visitorid;
  }

  @override
  int get hashCode {
    return key.hashCode ^ visitorid.hashCode;
  }
}

class AddTeamMemberArguments {
  const AddTeamMemberArguments({
    this.key,
    required this.memberid,
  });

  final _i12.Key? key;

  final String memberid;

  @override
  String toString() {
    return '{"key": "$key", "memberid": "$memberid"}';
  }

  @override
  bool operator ==(covariant AddTeamMemberArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.memberid == memberid;
  }

  @override
  int get hashCode {
    return key.hashCode ^ memberid.hashCode;
  }
}

class AddProductScreenArguments {
  const AddProductScreenArguments({
    this.key,
    required this.productid,
  });

  final _i12.Key? key;

  final String productid;

  @override
  String toString() {
    return '{"key": "$key", "productid": "$productid"}';
  }

  @override
  bool operator ==(covariant AddProductScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.productid == productid;
  }

  @override
  int get hashCode {
    return key.hashCode ^ productid.hashCode;
  }
}

extension NavigatorStateExtension on _i13.NavigationService {
  Future<dynamic> navigateToSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomePage([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homePage,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginViewScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginViewScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVisitorList([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.visitorList,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddVisitor({
    _i12.Key? key,
    required String visitorid,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addVisitor,
        arguments: AddVisitorArguments(key: key, visitorid: visitorid),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddTeamMember({
    _i12.Key? key,
    required String memberid,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addTeamMember,
        arguments: AddTeamMemberArguments(key: key, memberid: memberid),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTeamMemberList([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.teamMemberList,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToListDesignation([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.listDesignation,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddProductScreen({
    _i12.Key? key,
    required String productid,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addProductScreen,
        arguments: AddProductScreenArguments(key: key, productid: productid),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProductList([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.productList,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomePage([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homePage,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginViewScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginViewScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVisitorList([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.visitorList,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddVisitor({
    _i12.Key? key,
    required String visitorid,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addVisitor,
        arguments: AddVisitorArguments(key: key, visitorid: visitorid),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddTeamMember({
    _i12.Key? key,
    required String memberid,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addTeamMember,
        arguments: AddTeamMemberArguments(key: key, memberid: memberid),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTeamMemberList([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.teamMemberList,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithListDesignation([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.listDesignation,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddProductScreen({
    _i12.Key? key,
    required String productid,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addProductScreen,
        arguments: AddProductScreenArguments(key: key, productid: productid),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProductList([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.productList,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
