import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:relax_ride/constants.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/presentation/ui/screens/main_bottom_nav.dart';
import '../widgets/app_logo.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();

    Future<void> register() async {
      if (mainController.fnameController.text.isEmpty ||
          mainController.lnameController.text.isEmpty ||
          mainController.passwordController.text.isEmpty ||
          mainController.phoneController.text.isEmpty ||
          mainController.emailController.text.isEmpty ||
          mainController.cityController.text.isEmpty) {
        Get.snackbar('Error', 'All fields are required');
        return;
      }
      try {
        final response = await http.post(
          Uri.parse('$uri/signup'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'username': mainController.phoneController.text +
                mainController.fnameController.text +
                mainController.lnameController.text,
            'phone': mainController.phoneController.text,
            'password': mainController.passwordController.text,
            'email': mainController.emailController.text,
            'fname': mainController.fnameController.text,
            'lname': mainController.lnameController.text,
            'city': mainController.cityController.text,
          }),
        );

        if (response.statusCode == 201) {
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

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const AppLogo(height: 80),
              const SizedBox(height: 24),
              Text(
                'Complete Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              const Text('Get started with us with your details'),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              TextFormField(
                controller: mainController.fnameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: 'First Name',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 16)),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: mainController.lnameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 16)),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: mainController.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 16)),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: mainController.cityController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: 'City',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 16)),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: register,
                  child: const Text('Complete'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
