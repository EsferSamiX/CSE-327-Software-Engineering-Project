import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/Digitai_wallet/transactions.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/loan/free_user/freeUserPage1.dart';
import 'package:relax_ride/loan/gold_user/goldUserPage1.dart';
import 'package:relax_ride/loan/platinum_user/platinumUserPage1.dart';
import 'package:relax_ride/presentation/ui/screens/loan.dart';

import '../presentation/ui/utility/app_colors.dart';
import '../presentation/ui/utility/assets_path.dart';
import 'add_money/add_money1.dart';

MainController mainController = Get.find();

class DigitalWallet extends StatefulWidget {
  const DigitalWallet({super.key});

  @override
  State<DigitalWallet> createState() => _DigitalWalletState();
}

class _DigitalWalletState extends State<DigitalWallet> {
  MainController mainController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'My Wallet',
                      style: TextStyle(
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.primaryColor,
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 35,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.p1,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
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
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 10.0),
                              ),
                              const Text(
                                'Balance',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              const SizedBox(
                                width: 130,
                              ),
                              Image.asset(
                                AssetsPath.logo,
                                height: 20,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Center(
                            child: Text(
                              '৳${mainController.userData.data!.balance!.round()}',
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                  // const SizedBox(height: 20,),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 35,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const AddMoney());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.p1,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, 1),
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
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.p1,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => needLloanFoo());
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
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.snackbar('Thank you for your interest!',
                          'We are currently working on this feature. Please check back later.');
                      // Get.to(() => const Donation());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.p1,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, 1),
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
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'Add Money',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 65,
                  ),
                  Text(
                    'Loan',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    'Donate',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  //Get.to(() => const Transactions());
                   Get.snackbar('Thank you for your interest!',
                   'We are currently working on this feature. Please check back later.');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.p1,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
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
                            const Text(
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
          mainController.userData.data!.package == 0
              ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.5)),
                    child: Center(
                      child: Text('This feature is for jetsetter',
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

Widget needLloanFoo() {
  if (mainController.userData.data!.package == 0) {
    return const FreeUserP1();
  } else if (mainController.userData.data!.package == 1) {
    return const GoldUserP1();
  } else if (mainController.userData.data!.package == 2) {
    return const PlatinumUserP1();
  } else {
    return const FreeUserP1();
  }
}
