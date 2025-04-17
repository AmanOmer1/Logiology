import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logiology/Pages/Homepage.dart';

class AuthForLoginController extends GetxController {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final defaultUsername = 'admin'.obs;
  final defaultPassword = 'Pass@123'.obs;
  void Login() {
    final UserName = userNameController.text;
    final Password = passwordController.text;

    if (UserName == defaultUsername.value &&
        Password == defaultPassword.value) {
      Get.offNamed('/home');
    } else {
      Get.snackbar('Login Failed', 'Please input correct Username or Password');
    }
  }
}
