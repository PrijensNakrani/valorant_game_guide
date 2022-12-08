import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valorant_game_guide/view/bottom_bar.dart';
import 'package:valorant_game_guide/view/utils/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  @override
  void initState() {
    timer = Timer(
      Duration(seconds: 2),
      () => Get.offAll(
        () => BottomBar(),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backDrop,
      body: Center(
        child: Image.asset(
          'assets/image/Frame 826.png',
          height: height * 0.17,
          width: height * 0.17,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
