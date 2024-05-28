import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'gold_page5.dart';

class GoldPaymentSuccess extends StatefulWidget {
  const GoldPaymentSuccess({Key? key}) : super(key: key);

  @override
  State<GoldPaymentSuccess> createState() => _GoldPaymentSuccessState();
}

class _GoldPaymentSuccessState extends State<GoldPaymentSuccess> {
  @override
  void initState(){
    super.initState();
    moveToNextScreen();
  }

  void moveToNextScreen() async{
    await Future.delayed(Duration(seconds: 4));
    Get.offAll( GoldCongra());
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Center(
            child: Image.asset(
              'assets/images/success.gif',
              width: 200,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Successful',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 40),
          Text(
            'Your payment was done successfully!!!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 40),

        ],
      ),
    );
  }
}


