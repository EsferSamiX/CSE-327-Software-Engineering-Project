import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:relax_ride/presentation/ui/screens/main_bottom_nav.dart';

class DonationSuccess extends StatefulWidget {
  const DonationSuccess({Key? key}) : super(key: key);

  @override
  State<DonationSuccess> createState() => _DonationSuccessState();
}

class _DonationSuccessState extends State<DonationSuccess> {
  @override
  void initState(){
    super.initState();
    moveToNextScreen();
  }

  void moveToNextScreen() async{
    await Future.delayed(Duration(seconds: 4));
    Get.offAll( MainBottomNav());
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
            'Your donation was done successfully!!!',
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

