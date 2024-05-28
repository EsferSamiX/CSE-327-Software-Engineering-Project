import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:relax_ride/constants.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/presentation/ui/screens/main_bottom_nav.dart';

import '../widgets/app_logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  MainController mainController = Get.find();
  String _message = '';

  Future<void> login() async {
    if (mainController.passwordController.text.isEmpty ||
        mainController.phoneController.text.isEmpty) {
      Get.snackbar('Error', 'All fields are required');
      return;
    }
    try {
      final response = await http.post(
        Uri.parse('$uri/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': mainController.phoneController.text,
          'phone': mainController.phoneController.text,
          'password': mainController.passwordController.text
        }),
      );

      if (response.statusCode == 200) {
        mainController.setData('data', response.body);
        Get.offAll(() => const MainBottomNav());
        mainController.inputClear();
      } else if (response.statusCode == 409) {
        // User already registered
        Get.snackbar('Error', 'User/Phone number already exists');
        debugPrint('Phone number already exists');
      } else {
        // Handle other status codes if needed
        Get.snackbar('Error', 'Error occurred during registration');
        debugPrint('Unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error occurred during registration');
      // Handle error
      debugPrint('Error occurred during registration: $e');
    }
  }

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
                      Get.to(() => const MainBottomNav());
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
              const Text('Give those credential for login'),
              const SizedBox(height: 16),
              TextFormField(
                controller: mainController.phoneController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Phone'),
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
                  onPressed: login,
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
