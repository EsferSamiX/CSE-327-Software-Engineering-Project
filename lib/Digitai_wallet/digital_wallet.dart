import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:relax_ride/Digitai_wallet/donation.dart';
import 'package:relax_ride/Digitai_wallet/transactions.dart';
import 'package:relax_ride/presentation/ui/screens/loan.dart';

import '../presentation/ui/utility/app_colors.dart';
import '../presentation/ui/utility/assets_path.dart';
import 'add_money/add_money1.dart';

class DigitalWallet extends StatefulWidget {
  const DigitalWallet({super.key});

  @override
  State<DigitalWallet> createState() => _DigitalWalletState();
}

class _DigitalWalletState extends State<DigitalWallet> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        body: Column(

          children: [
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
              child: Row(
                children: [
                  const SizedBox(height: 30,),
                  Text(
                    'My Wallet',
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

            Row(
              children: [
                const SizedBox(width: 35,),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.p1,
                    borderRadius: BorderRadius.circular(40),
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
                    width: 340,
                    height: 220,
                    child: Column(
                      children: [
                        const SizedBox(height: 40,),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 30,),

                            Padding(

                              padding: const EdgeInsets.only(right: 10.0),

                            ),
                            Text('Balance',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: AppColors.primaryColor,
                            ),),
                            const SizedBox(width: 130,),

                            Image.asset(
                              AssetsPath.logo,
                              height: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start, // Aligns items at the start vertically
                          children: [
                            const SizedBox(width: 50,),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0, top: 2.0), // Adjusted left padding and added top padding to align the icon
                              child:

                              Text('৳3450',
                                style:TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ) ,)
                            ),
                            const SizedBox(width: 10),

                          ],
                        ),


                      ],
                    ),

                  ),
                ),
               // const SizedBox(height: 20,),

              ],
            ),

            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 35,),
                GestureDetector(
                  onTap: () {
                    Get.to(AddMoney());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.p1,
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
                      width: 100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsPath.addMoney,
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.p1,
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
                  child: GestureDetector(
                    onTap: () {
                      Get.to(NeedLloan());
                    },
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsPath.loan,
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 20,),
                GestureDetector(
                  onTap: () {
                    Get.to(Donation());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.p1,
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
                      width: 100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 12),
                              Image.asset(
                                AssetsPath.donate,
                                height: 60,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                const SizedBox(width: 40,),
                Text('Add Money',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),),
                const SizedBox(width: 65,),
                Text('Loan',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                ),),
                const SizedBox(width: 80,),
                Text('Donate',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),),

              ],
            ),
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: () {
                Get.to(Transactions());
              },
              child: Container(
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
                  width: 380,
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Image.asset(
                            AssetsPath.tran,
                            height: 60,
                          ),
                          const SizedBox(width: 20),
                          Text(
                            'Transactions',
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
    );
  }
}
