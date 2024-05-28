import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/presentation/ui/screens/complete_profile_screen.dart';

import '../widgets/app_logo.dart';

import 'main_bottom_nav.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final MainController mainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              /*
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      Get.to(const MainBottomNav());
                    },
                    child: const Text('Skip'),
                  ),
                ),
              ),

               */
              const SizedBox(height: 200),
              const AppLogo(height: 80),
              const SizedBox(height: 24),
              // Text('Welcome back',
              // style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 4),
              const Text('Please register your account first'),
              const SizedBox(height: 16),

              TextFormField(
                controller: mainController.phoneController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Phome',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 16)),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: mainController.passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const CompleteProfileScreen());
                  },
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
