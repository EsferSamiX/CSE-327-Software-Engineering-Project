import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../loan/free_user/freeUserPage1.dart';
import '../../../loan/gold_user/goldUserPage1.dart';
import '../../../loan/platinum_user/platinumUserPage1.dart';
import '../utility/app_colors.dart';
import '../utility/assets_path.dart';

class NeedLloan extends StatelessWidget {
  const NeedLloan({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [

              ],
            ),

           const SizedBox(height: 40,),
            Container(

              child: SizedBox(
                width: 250,
                child: ElevatedButton(onPressed: (){
                  Get.to(const FreeUserP1());
                },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle),
                      const SizedBox(width: 5,),
                      Text('free user'),
                    ],
                  ),),

              ),
            ),
            const SizedBox(height: 20,),
            Container(

              child: SizedBox(
                width: 250,
                child: ElevatedButton(onPressed: (){
                  Get.to(const GoldUserP1());
                },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle),
                      const SizedBox(width: 5,),
                      Text('gold user'),
                    ],
                  ),),

              ),
            ),
            const SizedBox(height: 20,),
            Container(

              child: SizedBox(
                width: 250,
                child: ElevatedButton(onPressed: (){
                  Get.to(const PlatinumUserP1());
                },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle),
                      const SizedBox(width: 5,),
                      Text('platinum user'),
                    ],
                  ),),

              ),
            )

          ],
        ),
    );
  }
}
