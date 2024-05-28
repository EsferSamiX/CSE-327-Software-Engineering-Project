import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presentation/ui/screens/loan.dart';

class Loan1 extends StatelessWidget {
  const Loan1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NeedLloan(),
    );
  }
}
