import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/presentation/ui/screens/jet_setter/gold/gold_page3.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';

import '../../../utility/assets_path.dart';

class GoldForm extends StatefulWidget {
  const GoldForm({super.key});

  @override
  State<GoldForm> createState() => _GoldFormState();
}

class _GoldFormState extends State<GoldForm> {
  bool _agreeToTerms = false;
  MainController mainController = Get.find();
  bool isSeleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                AssetsPath.gold,
                height: 80,
                width: 80,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Gold JetSetter',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 28,
                    ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text('Please provide the necessary information'),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: TextEditingController(
                    text: mainController.userData.data!.fname),
                decoration: const InputDecoration(
                  hintText: 'First Name',
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: TextEditingController(
                    text: mainController.userData.data!.lname),
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: TextEditingController(
                    text: mainController.userData.data!.phone),
                decoration: const InputDecoration(
                  hintText: 'Mobile',
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: TextEditingController(
                    text: mainController.userData.data!.email),
                decoration: const InputDecoration(
                  hintText: 'City',
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'NID Card Number',
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Checkbox(
                    value: _agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreeToTerms = value!;
                      });
                    },
                    activeColor: AppColors.primaryColor,
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'I agree to the terms and conditions',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: _agreeToTerms
                          ? MaterialStateProperty.all(AppColors.primaryColor)
                          : MaterialStateProperty.all(Colors.grey)),
                  onPressed: () {
                    Get.to(const GoldPayment());
                  },
                  child: const Text('Proceed to payment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
