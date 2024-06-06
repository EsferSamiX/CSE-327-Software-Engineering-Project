import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/presentation/ui/screens/main_bottom_nav.dart';
import 'package:relax_ride/presentation/ui/screens/register_account.dart';
import 'package:relax_ride/presentation/ui/screens/verify_login.dart';

import '../widgets/app_logo.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),

          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                'Welcome!',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          const AppLogo(height: 80),
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            width: 380,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => LoginPage());
              },
              child: const Text('Login'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 380,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => RegisterPage());
              },
              child: const Text('Register'),
            ),
          ),
        ],
      ),
    );
  }
}
