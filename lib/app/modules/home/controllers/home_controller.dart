import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wallet_connect_bayu/app/data/model/data_state.dart';
import 'package:wallet_connect_bayu/app/data/model/session.dart';

import 'package:wallet_connect_bayu/app/routes/app_pages.dart';
import 'package:wallet_connect_bayu/app/widgets/toast/custom_toast.dart';

class HomeController extends GetxController {
  static const platform = MethodChannel('com.stockbit.wallet/battery');
  final session = "".obs;
  final result = "".obs;

  @override
  void onInit() {
    super.onInit();
    listSession();
    log("dsfdsfdsf");
  }

  Future<void> listSession() async {
    try {
      final result = await platform.invokeMethod('listSession');
      // log("dsfdsfdsf" + jsonEncode(result).toString());
      // Map<String, dynamic> myObject = {
      //   'topic': result['topic'],
      //   'name': result['name'],
      //   'icons': result['icons'],
      //   'accounts': result['accounts']
      // };
      // List<Map<String, dynamic>> send = [];

      // send.add(myObject);
      session.value = jsonEncode(result);
    } on PlatformException catch (e) {
      Get.snackbar(
        "Sorry!",
        e.message.toString(),
        icon: Icon(Icons.dangerous, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }
}
