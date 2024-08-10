import 'package:contacts_book/User_controller.dart';
import 'package:contacts_book/home_page.dart';
import 'package:contacts_book/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Splash_Page extends StatelessWidget {
  const Splash_Page({super.key});

  @override
  Widget build(BuildContext context) {
    UserController controller = Get.put(UserController());
    controller.getUser().then((value) async {
      await Future.delayed(const Duration(seconds: 2));
      if (value.isNotEmpty) {
        Get.off(Home_page(user: value,));
      }
      else {
        Get.off(Login_Page());
      }
    });
    return Scaffold(
      body:
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blueAccent,
              Colors.purpleAccent,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assest/img/Animation - 1722333646088.json'),
            ],
          ),
        ),
      ),
    );
  }
}