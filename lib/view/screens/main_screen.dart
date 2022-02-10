import 'package:e_commerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? mainColor : darkGreyClr,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Get.isDarkMode ? mainColor : darkGreyClr,
          leading: Container(),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/shop.png'),
            )
          ],
          title: const Text(
            'MoAbnaser Shop',
          ),
          centerTitle: true,
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: 0,
        //   items: [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        //   ],
        //   type: BottomNavigationBarType.fixed,
        // ),
      ),
    );
  }
}
