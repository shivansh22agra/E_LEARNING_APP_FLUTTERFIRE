import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentGateway extends GetxController {
  late Razorpay? razorpay;
  @override
  void onInit() {
    razorpay = Razorpay();
    razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    super.onInit();
  }

  void handlePaymentError(PaymentFailureResponse paymentFailureResponse) {
    print(paymentFailureResponse.message);
    Get.snackbar("Error Occured", paymentFailureResponse.message!,backgroundColor: Colors.red
    );
  }

  void handlePaymentSuccess(PaymentSuccessResponse paymentSuccessResponse) {
    Get.snackbar("Success", paymentSuccessResponse.orderId!);
  }

  void handleExternalWallet(ExternalWalletResponse externalWalletResponse) {
    Get.snackbar("Error Occured External", externalWalletResponse.walletName!);
  }

  void dispatchPayment(
      int amount, String name, int contact, String email, String wallet) {
    var options = {
      "key": "rzp_test_e5aVeo87RSARnC",
      "amount": amount,
      "name": name,
      "description": "Payment for order #12345",
      "prefill": {"contact": contact, "email": email},
      "external":{
        "wallets": [wallet]
      }
    };

    try {
      razorpay?.open(options);
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}
