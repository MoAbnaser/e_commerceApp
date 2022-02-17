import 'package:e_commerce_app/logic/controllers/cart_controller.dart';
import 'package:e_commerce_app/logic/controllers/payment_controller.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/payment/delivery_continer_widget.dart';
import 'package:e_commerce_app/view/widgets/payment/payment_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);

  final cartController = Get.find<CartController>();
  final payMentController = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: const Text("Payment"),
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shipping to',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const DeliveryContainerWidget(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Payment method',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const PaymentMethodWidget(),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Total: ${cartController.total}\$",
                  style: TextStyle(
                    fontSize: 20,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      primary: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Pay Now",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              // GetBuilder<PayMentController>(
              //   builder: (_) {
              //     if (payMentController.paymentItems.isNotEmpty) {
              //       return Center(
              //         child: GooglePayButton(
              //           width: 200,
              //           height: 50,
              //           paymentConfigurationAsset: 'gpay.json',
              //           paymentItems: payMentController.paymentItems,
              //           style: GooglePayButtonStyle.black,
              //           type: GooglePayButtonType.pay,
              //           margin: const EdgeInsets.only(top: 15.0),
              //           onPaymentResult: (data) {
              //             print(data);
              //           },
              //           loadingIndicator: const Center(
              //             child: CircularProgressIndicator(),
              //           ),
              //         ),
              //       );
              //     } else {
              //       return Center(
              //         child: SizedBox(
              //           height: 50,
              //           width: 150,
              //           child: ElevatedButton(
              //             style: ElevatedButton.styleFrom(
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //               elevation: 0,
              //               primary: Get.isDarkMode ? pinkClr : mainColor,
              //             ),
              //             onPressed: () {},
              //             child: const Text(
              //               "Pay Now",
              //               style: TextStyle(
              //                 fontSize: 22,
              //                 color: Colors.white,
              //               ),
              //             ),
              //           ),
              //         ),
              //       );
              //     }
              //   },
              // ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
