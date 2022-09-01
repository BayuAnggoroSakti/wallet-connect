import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_connect_bayu/app/data/model/session.dart';

import 'package:wallet_connect_bayu/app/routes/app_pages.dart';
import 'package:wallet_connect_bayu/app/style/app_color.dart';
import 'package:wallet_connect_bayu/app/widgets/custom_bottom_navigation_bar.dart';
import 'package:wallet_connect_bayu/app/widgets/presence_card.dart';
import 'package:wallet_connect_bayu/app/widgets/presence_tile.dart';
import 'package:wallet_connect_bayu/app/widgets/toast/custom_toast.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(),
        extendBody: true,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 0,
            color: Colors.purple.shade100,
            child: //Text("Belum ada data")
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(() {
                      final sessionState = controller.session.value;
                      log(sessionState.toString());
                      return Text("Belum ada data");
                      // return ListTile(
                      //     leading: Image.network(
                      //      / sessionState[0]['icons'][0].toString(),
                      //       height: 90,
                      //       width: 90,
                      //     ),
                      //     title: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Center(
                      //           child: Text(sessionState[0]['name'].toString(),
                      //               style: TextStyle(
                      //                   color: Colors.black,
                      //                   fontWeight: FontWeight.bold,
                      //                   fontSize: 18))),
                      //     ),
                      //     subtitle: Center(
                      //         child: Text(sessionState[0]['account'].toString(),
                      //             style: TextStyle(
                      //                 color: Colors.indigo.shade500,
                      //                 fontWeight: FontWeight.bold,
                      //                 fontSize: 15))),
                      //     trailing: Icon(Icons.more_vert));
                    })),
          ),
        ));
  }
}
