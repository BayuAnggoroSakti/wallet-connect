import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:wallet_connect_bayu/app/routes/app_pages.dart';
import 'package:wallet_connect_bayu/app/widgets/dialog/custom_alert_dialog.dart';

class ScanController extends GetxController {
  static const platform = MethodChannel('com.stockbit.wallet/battery');
  String session = '';

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> scanQR() async {
    String session;
    try {
      session = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.QR);
      try {
        final String result =
            await platform.invokeMethod('getBarcode', {'code': session});
        if (result == "ShowSessionProposalDialog") {
          CustomAlertDialog.showPresenceAlert(
              title: 'Proposal confirmation',
              message:
                  'you need to confirm that you are an approve this proposal',
              onCancel: () {
                reject();
              },
              onConfirm: () async {
                approve();
              });
          // Get.defaultDialog(
          //     title: "Proposal Wallet",
          //     middleText: "Hello world!",
          //     backgroundColor: Colors.green,
          //     titleStyle: TextStyle(color: Colors.white),
          //     middleTextStyle: TextStyle(color: Colors.white),
          //     textConfirm: "Approve",
          //     textCancel: "Reject",
          //     cancelTextColor: Colors.white,
          //     confirmTextColor: Colors.white,
          //     buttonColor: Colors.red,
          //     barrierDismissible: false,
          //     radius: 50,
          //     onConfirm: () {
          //       approve();
          //     },
          //     content: Column(
          //       children: [
          //         Container(child: Text("Hello 1")),
          //         Container(child: Text("Hello 2")),
          //         Container(child: Text("Hello 3")),
          //       ],
          //     ));
        } else {
          log("check guys " + result);
        }
      } on PlatformException catch (e) {
        log("check guys " + e.toString());
      }
    } on PlatformException {}
  }

  Future<void> approve() async {
    String session;
    try {
      final String result = await platform.invokeMethod('approve');
      Get.offAllNamed(Routes.HOME);
    } on PlatformException catch (e) {
      session = "Failed to get battery level: '${e.message}'.";
    }
  }

  Future<void> reject() async {
    try {
      final String result = await platform.invokeMethod('reject');
      Get.back();
    } on PlatformException catch (e) {
      session = "Failed to get battery level: '${e.message}'.";
    }
  }
}
