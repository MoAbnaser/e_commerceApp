import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/settings/dark_mode_widget.dart';
import 'package:e_commerce_app/view/widgets/settings/language_widget.dart';
import 'package:e_commerce_app/view/widgets/settings/logout_widget.dart';
import 'package:e_commerce_app/view/widgets/settings/profile_widget.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileWidget(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          TextUtils(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            text: "GENERAL".tr,
            color: Get.isDarkMode ? pinkClr : mainColor,
            underLine: TextDecoration.none,
          ),
          const SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          const SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
          LogOutWidget(),
        ],
      ),
    );
  }
}
