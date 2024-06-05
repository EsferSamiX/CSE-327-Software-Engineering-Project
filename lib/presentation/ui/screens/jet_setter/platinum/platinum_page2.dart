import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';

import 'package:relax_ride/presentation/ui/screens/jet_setter/platinum/platinum_page3.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';

import '../../../utility/assets_path.dart';

class PlatinumForm extends StatefulWidget {
  const PlatinumForm({super.key});

  @override
  State<PlatinumForm> createState() => _PlatinumFormState();
}

class _PlatinumFormState extends State<PlatinumForm> {
  bool _agreeToTerms = false;
  MainController mainController = Get.find();

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
                AssetsPath.platinum,
                height: 80,
                width: 80,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Platinum JetSetter',
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
                controller: TextEditingController(
                    text: mainController.userData.data!.phone),
                keyboardType: TextInputType.phone,
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
                    text: mainController.userData.data!.city),
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _agreeToTerms ? AppColors.primaryColor : Colors.grey,
                  ),
                  onPressed: () {
                    if (!_agreeToTerms) {
                      return;
                    }
                    Get.to(() => const PlatinumPayment());
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
