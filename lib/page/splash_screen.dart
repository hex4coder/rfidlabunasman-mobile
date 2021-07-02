import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rfidlabunasman/page/home_screen.dart';
import 'package:rfidlabunasman/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Get.offAll(() => HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    final loadingSize = 40.0;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: s.height,
          width: s.width,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset('assets/img/logo.png'),
              const SizedBox(
                height: 20,
              ),
              Text(
                "RFID Lab Unasman",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: kPrimaryColor,
                    ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Versi 1.0",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: kTextColor,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: loadingSize,
                  height: loadingSize,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                    backgroundColor: kTextColor.withOpacity(.2),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
