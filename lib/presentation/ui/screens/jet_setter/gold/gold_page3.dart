import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/constants.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:http/http.dart' as http;

import '../../../utility/app_colors.dart';
import 'gold_page4.dart';

MainController mainController = Get.find();

class GoldPayment extends StatefulWidget {
  const GoldPayment({super.key});

  @override
  State<GoldPayment> createState() => _GoldPaymentState();
}

class _GoldPaymentState extends State<GoldPayment> {
  @override
  void initState() {
    mainController.selectedPaymentMethod.value = false;
    super.initState();
  }

  void fetchPayment() async {
    try {
      final response = await http.post(
        Uri.parse('$uri/jetSetter'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userId': mainController.userData.data!.id.toString(),
          'packageId': "1",
        }),
      );

      if (response.statusCode == 200) {
        mainController.setData('data', response.body);
        Get.to(() => const GoldPaymentSuccess());
        mainController.inputClear();
      } else if (response.statusCode == 409) {
        // User already registered
        Get.snackbar('Error', 'Payment failed!');
        debugPrint('Phone number already exists');
      } else {
        // Handle other status codes if needed
        Get.snackbar('Error', 'Error occurred during payment!');
        debugPrint('Unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error occurred during processing payment!');
      // Handle error
      debugPrint('Error occurred during registration: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                      'Payment',
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
              const Row(
                children: [
                  SizedBox(
                    height: 5,
                    width: 8,
                  ),
                  Text(
                    'Select Payment  Method',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const RadioWidget(),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: '1000',
                readOnly: true,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24.0),
                decoration: InputDecoration(
                  labelText: 'Amount',
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(color: AppColors.primaryColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                return SizedBox(
                  width: 130,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          mainController.selectedPaymentMethod.value
                              ? AppColors.primaryColor
                              : Colors.grey,
                    ),
                    onPressed: () {
                      fetchPayment();
                      // Get.to(() => const GoldPaymentSuccess());
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Payment',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentMethod {
  final String name;
  final String imagePath;

  PaymentMethod(this.name, this.imagePath);
}

class RadioWidget extends StatefulWidget {
  const RadioWidget({super.key});

  @override
  RadioWidgetState createState() => RadioWidgetState();
}

class RadioWidgetState extends State<RadioWidget> {
  PaymentMethod? _selectedPaymentMethod;

  final List<PaymentMethod> paymentMethods = [
    PaymentMethod('Bkash', 'assets/images/bkash.png'),
    PaymentMethod('Nagad', 'assets/images/nagad.png'),
    PaymentMethod('Nexuspay', 'assets/images/nexus.png'),
    PaymentMethod('Eastern Bank', 'assets/images/eastern.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _selectedPaymentMethod != null
            ? Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_selectedPaymentMethod!.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(_selectedPaymentMethod!.name),
                ],
              )
            : const SizedBox(),
        const SizedBox(height: 20),
        Theme(
          data: Theme.of(context).copyWith(
            radioTheme: RadioThemeData(
              fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return AppColors.primaryColor;
                  }
                  return Colors.black;
                },
              ),
            ),
          ),
          child: Column(
            children: paymentMethods
                .map(
                  (method) => RadioListTile<PaymentMethod>(
                    title: Container(
                      height: 65,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
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
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(method.imagePath),
                                //fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(method.name),
                        ],
                      ),
                    ),
                    value: method,
                    groupValue: _selectedPaymentMethod,
                    onChanged: (PaymentMethod? value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                        mainController.selectedPaymentMethod.value = true;
                      });
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
