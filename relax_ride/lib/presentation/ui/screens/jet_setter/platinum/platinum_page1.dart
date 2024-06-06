import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';
import 'Platinum_page2.dart';

class PlatinumPage extends StatefulWidget {
  const PlatinumPage({super.key});

  @override
  State<PlatinumPage> createState() => _PlatinumPageState();
}

class _PlatinumPageState extends State<PlatinumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Platinum JetSetter',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          backgroundColor: AppColors.p1.withOpacity(0.2),
          elevation: 3,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.p1,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1, 1),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Key Features',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      //color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, top: 2.0),
                        child: Icon(Icons.check_circle,
                            size: 16, color: Colors.green),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('You can use 80% of your package'),
                          SizedBox(height: 5),
                          Text('subscription fee'),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.check_circle,
                            size: 16, color: Colors.green),
                      ),
                      Text('Can withdraw booking before 12 hours.'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.check_circle,
                            size: 16, color: Colors.green),
                      ),
                      Text('Can avail 3 seat from loan facilities.'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, top: 2.0),
                        child: Icon(Icons.check_circle,
                            size: 16, color: Colors.green),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('You can enjoy upto 30% discounts from '),
                          SizedBox(height: 5),
                          Text('our partners like reknowed hotels and shops'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.p1,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1, 1),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30, top: 3),
                        child: Icon(Icons.check_circle,
                            size: 16, color: Colors.green),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 3),
                        child: Text(
                          'Pay the subscription fee of 3000 TK \nto unlock access to Platinum JetSetter\nbenefits.',
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30, top: 3),
                        child: Icon(Icons.check_circle,
                            size: 16, color: Colors.green),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 3),
                        child: Text(
                          'Fill the given form',
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 30,
                            top:
                                3), // Adjust top padding to align with the icon
                        child: Icon(Icons.check_circle,
                            size: 16, color: Colors.green),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10.0,
                            top:
                                3), // Adjust top padding to align with the icon
                        child: Text(
                          'Select a payment gateway.',
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.check_circle,
                            size: 16, color: Colors.green),
                      ),
                      Text('Proceed to payment '),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          width: 250,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => const PlatinumForm());
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Subscribe'),
                ],
              ),
            ),
          ),
        ));
  }
}
