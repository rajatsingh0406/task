import 'dart:async';

import 'package:flutter/material.dart';

import 'login_page.dart';


class FlashScreen extends StatefulWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 2), () {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LoginPage();
      }));

    });
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body:  Center(
        child: Container(
          height: 224,
          width: 316,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/imsmartlogo.png'))
          ),
        ),
      ),
    ),
    );
  }
}
