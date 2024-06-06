import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:relax_ride/presentation/ui/screens/home_screen.dart';

import '../../../utility/app_colors.dart';
import '../../../utility/assets_path.dart';
import '../../main_bottom_nav.dart';

class GoldCongra extends StatefulWidget {
  const GoldCongra({Key? key}) : super(key: key);

  @override
  State<GoldCongra> createState() => _GoldCongraState();
}

class _GoldCongraState extends State<GoldCongra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsPath.gold,
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 15,),
            Image.asset(
              AssetsPath.con,
              height: 100,
              width: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Congratulations!\nYou are now a Gold Jetsetter',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 380,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  Get.to(MainBottomNav());
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: AppColors.primaryColor,
                ),
                child: Text(
                  'Go back to home screen',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
