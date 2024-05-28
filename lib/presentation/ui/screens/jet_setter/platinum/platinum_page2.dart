import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:relax_ride/presentation/ui/screens/jet_setter/platinum/platinum_page3.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';

import '../../../utility/assets_path.dart';


class PlatinumForm extends StatefulWidget {
  const PlatinumForm({Key? key}) : super(key: key);

  @override
  State<PlatinumForm> createState() => _PlatinumFormState();
}

class _PlatinumFormState extends State<PlatinumForm> {
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100,),
              Image.asset(
                AssetsPath.platinum,
                height: 80,
                width: 80,
              ),
              const SizedBox(height: 24,),
              Text('Platinum JetSetter',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 28,
                ),),
              const SizedBox(height: 4,),
              Text('Please provide the necessary information'),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'First Name',
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Last Name',
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Mobile',
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'City',
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'NID Card Number',
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 24,),
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
                  Expanded(
                    child: Text(
                      'I agree to the terms and conditions',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(PlatinumPayment());
                  },
                  child: Text('Proceed to payment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}