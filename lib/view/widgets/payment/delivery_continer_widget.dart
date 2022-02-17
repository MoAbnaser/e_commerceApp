import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/logic/controllers/payment_controller.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  final TextEditingController phoneController = TextEditingController();
  int radioContainerIndexs = 1;
  bool changeColors = false;

  final controller = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContiner(
          address: "Egypt,Cairo, NasrCity ",
          name: "MoAbnaser store",
          phone: "51-887-9932",
          title: "MoAbnaser Shop",
          value: 1,
          color: changeColors ? Colors.white : Colors.grey.shade300,
          icon: Container(),
          onChanged: (int? value) {
            setState(() {
              radioContainerIndexs = value!;
              changeColors = !changeColors;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => buildRadioContiner(
            address: controller.address.value,
            name: authController.displayUserName.value,
            phone: controller.phoneNumber.value,
            title: "Delivery",
            value: 2,
            color: changeColors ? Colors.grey.shade300 : Colors.white,
            icon: InkWell(
              onTap: () {
                Get.defaultDialog(
                  title: "Enter Your Phone Number",
                  titleStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.white,
                  radius: 10,
                  textCancel: " Cancel ",
                  confirmTextColor: Colors.black,
                  textConfirm: " Save ",
                  cancelTextColor: Colors.black,
                  onCancel: () {
                    Get.toNamed(AppRoutes.paymentScreen);
                  },
                  onConfirm: () {
                    Get.back();
                    controller.phoneNumber.value = phoneController.text;
                  },
                  buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                  content: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: phoneController,
                      cursorColor: Colors.black,
                      maxLength: 11,
                      keyboardType: TextInputType.text,
                      onSubmitted: (value) {
                        phoneController.text = value;
                      },
                      decoration: InputDecoration(
                        fillColor: Get.isDarkMode
                            ? pinkClr.withOpacity(0.1)
                            : mainColor.withOpacity(0.2),
                        focusColor: Colors.red,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            phoneController.clear();
                          },
                          icon: const Icon(Icons.close, color: Colors.black),
                        ),
                        hintText: "Enter Your Phone Number",
                        hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.contact_phone,
                color: Get.isDarkMode ? pinkClr : mainColor,
                size: 20,
              ),
            ),
            onChanged: (int? value) {
              setState(() {
                radioContainerIndexs = value!;
                changeColors = !changeColors;
              });
              controller.updatePosition();
            },
          ),
        ),
      ],
    );
  }

  Widget buildRadioContiner({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContainerIndexs,
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
            onChanged: (int? value) {
              onChanged(value);
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text('🇪🇬+02 '),
                    Text(
                      phone,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    SizedBox(
                      child: icon,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  address,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
