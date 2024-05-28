import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../presentation/ui/screens/jet_setter.dart';
import '../../presentation/ui/utility/app_colors.dart';
import '../../presentation/ui/utility/assets_path.dart';

class FreeUserP1 extends StatefulWidget {
  const FreeUserP1({super.key});

  @override
  State<FreeUserP1> createState() => _FreeUserP1State();
}

class _FreeUserP1State extends State<FreeUserP1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Column(
          children: [
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
              child: Row(
                children: [
                  const SizedBox(height: 30,),
                  Text(
                    'My Loan',
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(width: 180,),
                  Image.asset(
                    AssetsPath.free,
                    height: 40,
                  ),

                ],
              ),
            ),

            Divider(
              color: AppColors.primaryColor,
              thickness: 1,
            ),
            const SizedBox(height: 30,),


            Row(
              children: [
                const SizedBox(width: 15,),
                Container(
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
                    width: 380,
                    height: 250,
                    child: Column(
                      children: [
                        const SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start, // Aligns items at the start vertically
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0, top: 2.0), // Adjusted left padding and added top padding to align the icon
                             // child: Icon(Icons.check_circle, size: 16, color: Colors.green),
                            ),
                            const SizedBox(width: 10), // Added space between icon and text
                            Column( // Wraps text in a column for vertical alignment
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('You are free user of this app for availing'), // Text before line gap
                               const SizedBox(height: 5), // Line gap
                                Text('seat as loan you have to subscribe any of our '),
                               const SizedBox(height: 5), // Line gap
                                Text('jetsetter schemes '),// Text after line gap
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 80,),
                        Container(

                          child: SizedBox(
                            width: 150,
                            child: ElevatedButton(onPressed: (){
                              Get.to(const jetSetter());
                            },

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Upgrade now'),
                                ],
                              ),),

                          ),
                        ),

                      ],
                    ),

                  ),
                ),



              ],
            ),
            const SizedBox(height: 40,),
            Container(
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
                width: 380,
                height: 250,
                child: Column(
                  children: [
                    const SizedBox(height: 5,),
                    Text('Loan History',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,

                    ),),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 3),
                         // child: Icon(Icons.check_circle, size: 16, color: Colors.green),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 3),
                          child: Text(
                            'No loan history available',
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),



                  ],
                ),

              ),
            ),
            const SizedBox(height: 30,),

          ],
        ),
    );
  }
}
