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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('$uri/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': '+880${mainController.phoneController.text}',
          'phone': '+880${mainController.phoneController.text}',
          'password': mainController.passwordController.text,
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
        Get.snackbar('Error', 'Error occurred during login');
        debugPrint('Unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error occurred during login');
      // Handle error
      debugPrint('Error occurred during login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),

                const SizedBox(height: 200),
                const AppLogo(height: 80),
                const SizedBox(height: 24),
                const SizedBox(height: 4),
                const Text('Give those credentials for login'),
                const SizedBox(height: 16),
                TextFormField(
                  controller: mainController.phoneController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '+880',
                    labelText: 'Phone',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  maxLength: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (!RegExp(r'^1[3-9]\d{8}$').hasMatch(value)) {
                      return 'Please enter a valid phone number starting with 1 followed by 3-9';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: mainController.passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8 || value.length > 16) {
                      return 'Password must be 8-16 characters long';
                    } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                      return 'Password must contain at least one uppercase letter';
                    } else if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
                      return 'Password must contain at least one lowercase letter';
                    } else if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
                      return 'Password must contain at least one digit';
                    } else if (!RegExp(r'(?=.*[@$!%*?&])').hasMatch(value)) {
                      return 'Password must contain at least one special character (@\$!%*?&)';
                    }
                    return null;
                  },
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
      ),
    );
  }
}
