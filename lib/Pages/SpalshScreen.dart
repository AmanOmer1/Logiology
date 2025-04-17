import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logiology/Pages/LoginPage.dart';

class SpalshsSreen extends StatefulWidget {
  const SpalshsSreen({super.key});

  @override
  State<SpalshsSreen> createState() => _SpalshsSreenState();
}

class _SpalshsSreenState extends State<SpalshsSreen> {
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Get.offAll(() => LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade700,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/Assets/Images/LOGIOLOGYs.png', height: 150),
          ],
        ),
      ),
    );
  }
}
