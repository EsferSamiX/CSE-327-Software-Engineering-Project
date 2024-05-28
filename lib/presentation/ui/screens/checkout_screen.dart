import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/constants.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/presentation/ui/screens/main_bottom_nav.dart';
import 'package:relax_ride/presentation/ui/screens/payment_success.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';
import 'package:http/http.dart' as http;

RxBool radioWidgetSelectedState = false.obs;

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? _selectedValue = 'Abdullahpur';
  MainController mainController = Get.find();

  @override
  void initState() {
    radioWidgetSelectedState.value = false;
    super.initState();
  }

  Future<void> confirmTrip(context) async {
    try {
      final response = await http.post(
        Uri.parse('$uri/tripConfirm'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userId': mainController.userId.value,
          'tripId': mainController.tripId.value,
          'seatTakenLength': mainController.seatTakenLength.value.toString(),
          'seatTaken': mainController.seatTaken.value,
        }),
      );

      if (response.statusCode == 201) {
        // tripResponseData = TripModel.fromJson(jsonDecode(response.body));
        debugPrint('Trip fetched successfully. ${response.body}');
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //     builder: (context) => const MainBottomNav(),
        //   ),
        // );
        Get.offAll(() => const MainBottomNav());
        Get.to(() => const PaymentSuccess());
      } else if (response.statusCode == 409) {
        // User already registered
        Get.snackbar('Error', 'User/Phone number already exists');
        debugPrint('Phone number already exists');
      } else {
        // Handle other status codes if needed
        Get.snackbar('Error', 'Error occurred during trip');
        debugPrint('Unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error occurred during trip');
      // Handle error
      debugPrint('Error occurred during fetching trip: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Checkout',
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
                  'Select Boarding Point',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButton(
                      value: _selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedValue = newValue;
                        });
                        debugPrint(newValue);
                      },
                      items: [
                        'Abdullahpur',
                        'Airport ',
                        'Norda',
                        'Rampura',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
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
            const RadioWidget(),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: TextEditingController(
                text:
                '${(mainController.seatTakenLength.value * mainController.selectedPrice.value).toStringAsFixed(2)} BDT',
              ),
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
              height: 50,
            ),
            SizedBox(
              width: 380,
              height: 50,
              child: Obx(() {
                return ElevatedButton(
                  onPressed: () async {
                    await confirmTrip(context);
                    // Get.to(const PaymentSuccess());
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: radioWidgetSelectedState.value
                        ? AppColors.primaryColor
                        : Colors.grey.shade400,
                  ),
                  child: const Text(
                    'Pay',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
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
                        radioWidgetSelectedState.value = true;

                        _selectedPaymentMethod = value;
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
