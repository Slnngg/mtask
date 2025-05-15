// ignore_for_file: prefer_const_constructors

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mtest_app/home/controller/home_binding.dart';
import 'package:mtest_app/pages/auth/controller/auth_binding.dart';
import 'package:mtest_app/pages/auth/login/login_page.dart';
import 'package:mtest_app/pages/auth/registration/account_info/account_info_page.dart';
import 'package:mtest_app/pages/auth/registration/create_account/create_account_page.dart';
import 'package:mtest_app/pages/auth/registration/otp/otp_page.dart';
import 'package:mtest_app/pages/auth/registration/registration_page.dart';
import 'package:mtest_app/home/home_page.dart';
import 'package:mtest_app/pages/send/controller/method_view.dart';
import 'package:mtest_app/pages/send/controller/send_binding.dart';
import 'package:mtest_app/pages/send/select_purpose_steps_page.dart';
import 'package:mtest_app/pages/send/send_page.dart';
import 'package:mtest_app/pages/splash/controller/splash_binding.dart';
import 'package:mtest_app/pages/splash/splash_screen.dart';
import 'package:mtest_app/routes/route_names.dart';
import 'package:get/get.dart';

class AppRouter {
  static final List<GetPage> routes = [
    /// Splash
    GetPage(
      name: '/${RouteNames.splash}',
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),

    /// Registration
    GetPage(
      name: '/${RouteNames.registration}',
      page: () => const RegistrationPage(),
      binding: AuthBinding(),
    ),

    /// Registration
    GetPage(
      name: '/${RouteNames.login}',
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),

    /// Create Account
    GetPage(
      name: '/${RouteNames.createAccount}',
      page: () => const CreateAccountPage(),
      binding: AuthBinding(),
    ),

    /// Account info
    GetPage(
      name: '/${RouteNames.accountInfo}',
      page: () => const AccountInfoPage(),
      binding: AuthBinding(),
    ),

    /// OTP
    GetPage(
      name: '/${RouteNames.otpPage}',
      page: () => const OtpPage(),
      binding: AuthBinding(),
    ),

    /// HomePage
    GetPage(
      name: '/${RouteNames.homePage}',
      page: () => HomePage(),
      binding: HomeBinding(),
    ),

    /// Send page
    GetPage(
      name: '/${RouteNames.send}',
      page: () => SendPage(),
      binding: SendBinding(),
    ),

    /// Select Purpose page
    GetPage(
      name: '/${RouteNames.selectPurpose}',
      page: () => SelectPurposePage(),
      binding: SendBinding(),
    ),

    /// Method page
    GetPage(
      name: '/${RouteNames.methodView}',
      page: () => MethodViewPage(),
      binding: SendBinding(),
    ),
  ];
}
