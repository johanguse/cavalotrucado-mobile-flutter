import 'dart:async';
import 'package:cavalo_trucado/screens/home/home.dart';
import 'package:cavalo_trucado/utils/analytics.dart';
import 'package:flutter/material.dart';
import 'package:cavalo_trucado/one_signal.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    timer();
    configurePush();
    AnalyticsService.observer.analytics.setCurrentScreen(screenName: "Splash");

  }

  void configurePush(){
    final AppOneSignalController oneSignalController = AppOneSignalController();
    oneSignalController.initPlatformState();
  }

  timer() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: 20, right: 20, top: 44.92, bottom: 46.55),
            child: Text(
              "Cavalo Trucado",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
          ),
        ],
      ),
    );
  }
}
