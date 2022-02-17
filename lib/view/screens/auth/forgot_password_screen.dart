import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:e_commerce_app/utils/space_widget.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/auth_button.dart';
import 'package:e_commerce_app/view/widgets/auth/auth_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Forgot Password',
            style: TextStyle(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 25,
                right: 20,
                left: 20,
              ),
              child: Column(
                children: [
                  Text(
                    'If you want to recover your account, then please provide your email ID below..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const VerticalSpace(value: 5),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 250,
                  ),
                  const VerticalSpace(value: 5),
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
                  const VerticalSpace(value: 5),
                  GetBuilder<AuthController>(
                    builder: (_) {
                      return AuthButton(
                        text: 'Send',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.restPassword(
                              email: _emailController.text.trim(),
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
      ),
    );
  }
}
