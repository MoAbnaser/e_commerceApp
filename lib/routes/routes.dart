import 'package:e_commerce_app/logic/bindings/auth_binding.dart';
import 'package:e_commerce_app/logic/bindings/main_biding.dart';
import 'package:e_commerce_app/logic/bindings/product_biding.dart';
import 'package:e_commerce_app/view/screens/cart_screen.dart';
import 'package:e_commerce_app/view/screens/auth/forgot_password_screen.dart';
import 'package:e_commerce_app/view/screens/auth/login_screen.dart';
import 'package:e_commerce_app/view/screens/payment_screen.dart';
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
  static const cartScreen = '/cartScreen';
  static const paymentScreen = '/paymentScreen';

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
      bindings: [
        AuthBinding(),
        MainBiding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: cartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: paymentScreen,
      page: () => PaymentScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
        MainBiding(),
      ],
    ),
  ];
}
