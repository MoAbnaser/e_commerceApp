import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/logic/controllers/cart_controller.dart';
import 'package:e_commerce_app/logic/controllers/payment_controller.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  _PaymentMethodWidgetState createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  final paymentController = Get.find<PaymentController>();
  final cartController = Get.find<CartController>();
  final authController = Get.find<AuthController>();
  int radioPaymentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          GetBuilder<PaymentController>(
            builder: (_) => buildRadioPayment(
              name: "Paypal",
              image: 'assets/images/paypal.png',
              scale: 0.7,
              value: 1,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
                paymentController.removeGooglePay();
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GetBuilder<PaymentController>(
            builder: (_) => buildRadioPayment(
              name: "Google Pay",
              image: 'assets/images/google.png',
              scale: 0.8,
              value: 2,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
                paymentController.makeGooglePay(
                  amount: cartController.total.toString(),
                  label: authController.displayUserName.value,
                );
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GetBuilder<PaymentController>(
            builder: (_) => buildRadioPayment(
              name: "Credit Card",
              image: 'assets/images/credit.png',
              scale: 0.7,
              value: 3,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
                paymentController.removeGooglePay();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChange,
  }) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Radio(
            value: value,
            groupValue: radioPaymentIndex,
            fillColor: MaterialStateColor.resolveWith((states) => mainColor),
            onChanged: (int? value) {
              onChange(value);
            },
          ),
        ],
      ),
    );
  }
}
