import 'package:e_commerce_app/utils/space_widget.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String buttonChild;

  const ContainerUnder({
    required this.onPressed,
    required this.text,
    required this.buttonChild,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? mainColor: pinkClr,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const HorizontalSpace(value: .08),
          TextButton(
            onPressed: onPressed,
            child:  Text(
              buttonChild,
              style: const TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
