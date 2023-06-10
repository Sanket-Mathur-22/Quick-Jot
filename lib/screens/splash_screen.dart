import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_jot/screens/home_screen.dart';
import 'package:quick_jot/widgets/applogo.dart';
import 'package:velocity_x/velocity_x.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  changeScreen() {
    Future.delayed(Duration(seconds: 5), () {
      Get.to(() => const HomeScreen());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Vx.gray800,
          body: Center(
            child: Column(
              children: [
                280.heightBox,
                applogo(),
                15.heightBox,
                "Quick Jot".text.white.bold.size(35).make(),
              ],
            ),
          )),
    );
  }
}
