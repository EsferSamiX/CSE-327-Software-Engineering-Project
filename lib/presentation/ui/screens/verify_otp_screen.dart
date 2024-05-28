import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:relax_ride/presentation/ui/screens/register_account.dart';
import '../utility/app_colors.dart';
import '../widgets/app_logo.dart';
import 'complete_profile_screen.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  _VerifyOtpScreenState createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  int _start = 120;
  late Timer _timer;
  bool _resendButtonEnabled = false;
  // final FirebaseAuth auth= FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _resendButtonEnabled = true;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void resendOtp() {
    setState(() {
      _start = 120;
      _resendButtonEnabled = false;
      startTimer();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var code = "";
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              const AppLogo(
                height: 80,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Enter OTP Code',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 4,
              ),
              Text('A 4 digit OTP code has been sent'),
              const SizedBox(
                height: 24,
              ),
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.transparent,
                  inactiveFillColor: Colors.transparent,
                  inactiveColor: AppColors.primaryColor,
                  selectedFillColor: Colors.transparent,
                  selectedColor: Colors.purple,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (v) {
                  code = v;
                  print('Completed');
                },
                appContext: context,
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    // Create a PhoneAuthCredential with the code

                    // PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    // verificationId: PhoneVerify.verify, smsCode: code);

                    // Sign the user in (or link) with the credential
                    //await auth.signInWithCredential(credential);
                    Get.to(CompleteProfileScreen());
                  },
                  child: Text('Next'),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: 'This code will expire in ',
                    ),
                    TextSpan(
                      text: '$_start seconds',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: _resendButtonEnabled ? resendOtp : null,
                child: Text('Resend Code'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    _resendButtonEnabled ? AppColors.primaryColor : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
