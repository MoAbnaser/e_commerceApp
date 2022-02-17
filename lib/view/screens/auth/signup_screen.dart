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

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
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
                              'Sign',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Get.isDarkMode ? pinkClr : mainColor,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const HorizontalSpace(value: .9),
                            Text(
                              'UP',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const VerticalSpace(value: 7),
                        AuthTextFormField(
                          hintText: 'User Name',
                          inputType: TextInputType.name,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                            size: 30,
                          ),
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name';
                            } else {
                              return null;
                            }
                          },
                          controller: _nameController,
                        ),
                        const VerticalSpace(value: 3),
                        AuthTextFormField(
                          hintText: 'Email',
                          inputType: TextInputType.emailAddress,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Get.isDarkMode ? pinkClr : mainColor,
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
                                color: Get.isDarkMode ? pinkClr : mainColor,
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
                                            ? pinkClr
                                            : mainColor,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: Get.isDarkMode
                                            ? pinkClr
                                            : mainColor,
                                      ),
                                color: mainColor,
                              ),
                              obscureText:
                                  controller.isVisibility ? false : true,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password should be longer or equal 6 characters';
                                } else {
                                  return null;
                                }
                              },
                              controller: _passwordController,
                            );
                          },
                        ),
                        const VerticalSpace(value: 5),
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: GetBuilder<AuthController>(builder: (_) {
                                return Checkbox(
                                  fillColor:
                                      MaterialStateColor.resolveWith((states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return Colors.grey
                                          .shade200; // the color when checkbox is selected;
                                    }
                                    return Get.isDarkMode?Colors
                                        .white:Colors.grey
                                        .shade200 ; //the color when checkbox is unselected;
                                  }),
                                  checkColor:
                                      Get.isDarkMode ? pinkClr : mainColor,
                                  value: controller.isCheckedBox,
                                  onChanged: (value) {
                                    controller.checked();
                                  },
                                );
                              }),
                            ),
                            const HorizontalSpace(value: .9),
                            Text(
                              'I accept',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const HorizontalSpace(value: .08),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                ' terms & Conditions',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                        const VerticalSpace(value: 5),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthButton(
                              text: 'sign up',
                              onPressed: () {
                                if (controller.isCheckedBox == false) {
                                  Get.snackbar(
                                    'Check Box',
                                    'Please, Accept terms & Conditions',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.white24,
                                    colorText: Colors.black,
                                  );
                                } else if (_formKey.currentState!.validate()) {
                                  String name = _nameController.text.trim();
                                  String email = _emailController.text.trim();
                                  String password = _passwordController.text;
                                  controller.signUpUsingFirebase(
                                    name: name,
                                    email: email,
                                    password: password,
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const VerticalSpace(value: 1.5),
              ContainerUnder(
                text: 'Already have an Account?',
                onPressed: () {
                  Get.offNamed(AppRoutes.logInScreen);
                },
                buttonChild: 'Log in',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
