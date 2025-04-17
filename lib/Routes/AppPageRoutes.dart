import 'package:get/get.dart';
import 'package:logiology/Pages/Homepage.dart';
import 'package:logiology/Pages/LoginPage.dart';
import 'package:logiology/Pages/ProductDetailScreen.dart';
import 'package:logiology/Pages/SpalshScreen.dart';
import 'package:logiology/Pages/UserProfilePAge.dart';
import 'package:logiology/Routes/PageRoutes.dart';

class AppPageRoutes {
  static final pages = [
    GetPage(name: AppRoutes.LOGIN, page: () => LoginPage()),
    GetPage(name: AppRoutes.HOME, page: () => HomePage()),
    GetPage(name: AppRoutes.PROFILE, page: () => UserProfilePage()),
    GetPage(name: AppRoutes.SPLASH, page: () => SpalshsSreen()),
    GetPage(name: AppRoutes.DETAILS, page: () => ProductDetailScreen()),
  ];
}
