import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:e_commerce_app/utils/size_config.dart';
import 'package:e_commerce_app/utils/space_widget.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/screens/auth/container_under.dart';
import 'package:e_commerce_app/view/widgets/auth/auth_button.dart';
import 'package:e_commerce_app/view/widgets/auth/auth_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: SizeConfig.defaultSize! * 70,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Log',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Get.isDarkMode ? mainColor : pinkClr,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const HorizontalSpace(value: .9),
                            Text(
                              'in',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Get.isDarkMode
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const VerticalSpace(value: 7),
                        AuthTextFormField(
                          hintText: 'Email',
                          inputType: TextInputType.emailAddress,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Get.isDarkMode ? mainColor : pinkClr,
                            size: 30,
                          ),
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Invalid Email';
                            } else {
                              return null;
                            }
                          },
                          controller: _emailController,
                        ),
                        const VerticalSpace(value: 3),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFormField(
                              hintText: 'Password',
                              inputType: TextInputType.visiblePassword,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Get.isDarkMode ? mainColor : pinkClr,
                                size: 30,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibility
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: Get.isDarkMode
                                            ? mainColor
                                            : pinkClr,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: Get.isDarkMode
                                            ? mainColor
                                            : pinkClr,
                                      ),
                                color: mainColor,
                              ),
                              obscureText:
                                  controller.isVisibility ? false : true,
                              validator: (value) {
                                if (value.toString().length <= 6) {
                                  return 'Password should be longer or equal 6 characters';
                                } else {
                                  return null;
                                }
                              },
                              controller: _passwordController,
                            );
                          },
                        ),
                        const VerticalSpace(value: 1),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.forgotPasswordScreen);
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const VerticalSpace(value: 3),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            text: 'Log in',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                String email = _emailController.text.trim();
                                String password = _passwordController.text;
                                controller.logInUsingFirebase(
                                  email: email,
                                  password: password,
                                );
                              }
                            },
                          );
                        }),
                        const VerticalSpace(value: 1),
                        Text(
                          'Or',
                          style: TextStyle(
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        const VerticalSpace(value: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GetBuilder<AuthController>(builder: (_) {
                              return InkWell(
                                onTap: () {
                                  controller.faceBookSignUpApp();
                                },
                                child:
                                    Image.asset('assets/images/facebook.png'),
                              );
                            }),
                            const HorizontalSpace(value: 1.2),
                            GetBuilder<AuthController>(builder: (_) {
                              return InkWell(
                                onTap: () {
                                  controller.googleSinUpApp();
                                },
                                child: Image.asset(
                                  'assets/images/google.png',
                                ),
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const VerticalSpace(value: 1.5),
              ContainerUnder(
                text: 'Don\'t have an Account',
                onPressed: () {
                  Get.offNamed(AppRoutes.signUpScreen);
                },
                buttonChild: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
