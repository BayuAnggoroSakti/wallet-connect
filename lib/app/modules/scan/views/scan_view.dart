import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:wallet_connect_bayu/app/controllers/page_index_controller.dart';
import 'package:wallet_connect_bayu/app/routes/app_pages.dart';
import 'package:wallet_connect_bayu/app/style/app_color.dart';
import 'package:wallet_connect_bayu/app/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  final pageIndexController = Get.find<PageIndexController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFF6F8FA),
      appBar: AppBar(
        elevation: 0.1, // Check Platform if android
        backgroundColor: const Color(0xFFF6F8FA),
        title: new Center(
          child: new Text(
            'Wallet Connect',
            style: TextStyle(
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Container(
        color: const Color(0xFFF6F8FA),
        margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Container(
                //width: 260.0,
                height: 220.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(
                    new Radius.circular(16.0),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/qr.png',
                    width: 110.0,
                    height: 110.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 4.0),
                width: double.infinity,
                //height: 80.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(
                    new Radius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => controller.scanQR(),
              child: new Center(
                child: Container(
                  margin: EdgeInsets.only(top: 30.0),
                  width: 180.0,
                  height: 48.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.red,
                    borderRadius: new BorderRadius.all(
                      new Radius.circular(24.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'SCAN QR CODE',
                      style: TextStyle(
                        color: Colors.white,
//                    /fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
