import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:relax_ride/presentation/ui/screens/jet_setter/gold/gold_page1.dart';
import 'package:relax_ride/presentation/ui/screens/jet_setter/platinum/platinum_page1.dart';
import 'package:relax_ride/presentation/ui/screens/jet_setter/gold/gold_page1.dart';
import '../utility/app_colors.dart';
import '../utility/assets_path.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';

class jetSetter extends StatefulWidget {
  const jetSetter({super.key});

  @override
  State<jetSetter> createState() => _jetSetterState();
}

class _jetSetterState extends State<jetSetter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
              child: Row(
                children: [
                  const SizedBox(height: 30,),
                  Text(
                    'JetSetter',
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),

                ],
              ),
            ),

            Divider(
              color: AppColors.primaryColor,
              thickness: 1,
            ),
            const SizedBox(height: 20,),
            Text(
              'We have 2 JetSetter Schemes',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'You can explore those.',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 100),
            GestureDetector(
              onTap: () {
                Get.to(GoldPage());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.p1,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(1, 1),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: SizedBox(
                  width: 250,
                  height: 120,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Image.asset(
                        AssetsPath.gold,
                        height: 50,
                        width: 50,
                      ),
                      const Text(
                        '  Gold JetSetter',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Get.to(PlatinumPage());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.p1,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(1, 1),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: SizedBox(
                  width: 250,
                  height: 120,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Image.asset(
                        AssetsPath.platinum,
                        height: 50,
                        width: 50,
                      ),
                      const Text(
                        '  Platinum JetSetter',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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