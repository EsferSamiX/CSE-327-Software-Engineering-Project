import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/presentation/ui/screens/complete_profile_screen.dart';

import '../widgets/app_logo.dart';
import 'main_bottom_nav.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final MainController mainController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                const Text('Please register your account first'),
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
                  decoration: const InputDecoration(hintText: 'Password'),
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.to(() => const CompleteProfileScreen());
                      }
                    },
                    child: const Text('Register'),
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
