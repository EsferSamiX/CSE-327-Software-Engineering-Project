import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../presentation/ui/utility/app_colors.dart';
import '../../presentation/ui/utility/assets_path.dart';

class PlatinumUserP1 extends StatefulWidget {
  const PlatinumUserP1({super.key});

  @override
  State<PlatinumUserP1> createState() => _PlatinumUserP1State();
}

class _PlatinumUserP1State extends State<PlatinumUserP1> {
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
                  AssetsPath.platinum,
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
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: SizedBox(
                  width: 360,
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15,),
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 20,),


                          Text('Remaining Loan Seats :',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 20,),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: const Offset(1, 1),
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('3',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),),

                                ],
                              ),

                            ),
                          ),

                        ],
                      )

                    ],
                  ),

                ),

              ),

            ],
          ),

          const SizedBox(height: 60,),
          Container(

            child: SizedBox(
              width: 150,
              child: ElevatedButton(onPressed: (){

              },

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Avail now'),
                  ],
                ),),

            ),
          ),

          const SizedBox(height: 60,),
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
