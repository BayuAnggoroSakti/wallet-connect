import 'package:get/get.dart';
import 'package:wallet_connect_bayu/app/modules/home/bindings/home_binding.dart';
import 'package:wallet_connect_bayu/app/modules/home/views/home_view.dart';
import 'package:wallet_connect_bayu/app/modules/profile/bindings/profile_binding.dart';
import 'package:wallet_connect_bayu/app/modules/profile/views/profile_view.dart';
import 'package:wallet_connect_bayu/app/modules/scan/bindings/scan_binding.dart';
import 'package:wallet_connect_bayu/app/modules/scan/views/scan_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => ScanView(),
      binding: ScanBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
