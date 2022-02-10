import 'package:e_commerce_app/logic/bindings/auth_binding.dart';
import 'package:e_commerce_app/view/screens/auth/forgot_password_screen.dart';
import 'package:e_commerce_app/view/screens/auth/login_screen.dart';
import 'package:e_commerce_app/view/screens/auth/signup_screen.dart';
import 'package:e_commerce_app/view/screens/main_screen.dart';
import 'package:e_commerce_app/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  //initialRoutes
  static const welcomeScreen = '/welcomeScreen';
  static const logInScreen = '/logInScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';

  //getPages
  static final routes = [
    GetPage(
      name: welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: logInScreen,
      page: () => LogInScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: mainScreen,
      page: () => MainScreen(),
    ),
  ];
}
