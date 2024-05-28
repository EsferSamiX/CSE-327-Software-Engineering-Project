import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../presentation/ui/utility/app_colors.dart';
import 'add_money2.dart';

class AddMoney extends StatefulWidget {
  const AddMoney({super.key});

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
  TextEditingController _controller = TextEditingController();


  @override
  void initState() {
    super.initState();
    _controller.text = '';
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                child: Row(
                  children: [
                    const SizedBox(height: 30,),
                    Text(
                      'Add Money',
                      style: TextStyle(
                        fontSize: 26,
                      ),
                    ),

                  ],
                ),
              ),

              Divider(
                color: AppColors.primaryColor,
                thickness: 1,
              ),
              const SizedBox(height: 20,),

              Row(
                children: [
                  const SizedBox(height: 5,width: 8,),
                  Text(
                    'Select Payment  Method',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              RadioWidget(),

              const SizedBox(height: 20,),
              TextFormField(
                controller: _controller,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 24.0),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Amount',
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              SizedBox(
                width: 380,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                    Get.to(AddMoneySuccess());
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: AppColors.primaryColor,
                  ),
                  child: Text(
                    'Add money',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
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

class PaymentMethod {
  final String name;
  final String imagePath;

  PaymentMethod(this.name, this.imagePath);
}

class RadioWidget extends StatefulWidget {
  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  PaymentMethod? _selectedPaymentMethod;

  final List<PaymentMethod> paymentMethods = [
    PaymentMethod('Bkash', 'assets/images/bkash.png'),
    PaymentMethod('Nagad', 'assets/images/nagad.png'),
    PaymentMethod('Nexuspay', 'assets/images/nexus.png'),
    PaymentMethod('Eastern Bank', 'assets/images/eastern.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _selectedPaymentMethod != null
            ? Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_selectedPaymentMethod!.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(_selectedPaymentMethod!.name),
          ],
        )
            : SizedBox(),
        SizedBox(height: 20),
        Theme(
          data: Theme.of(context).copyWith(
            radioTheme: RadioThemeData(
              fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return AppColors.primaryColor;
                  }
                  return Colors.black;
                },
              ),
            ),
          ),
          child: Column(
            children: paymentMethods
                .map(
                  (method) => RadioListTile<PaymentMethod>(
                title: Container(
                  height: 65,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: const Offset(1, 1),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),

                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(

                          image: DecorationImage(
                            image: AssetImage(method.imagePath),
                            //fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(method.name),
                    ],
                  ),
                ),
                value: method,
                groupValue: _selectedPaymentMethod,
                onChanged: (PaymentMethod? value) {
                  setState(() {
                    _selectedPaymentMethod = value;
                  });
                },
              ),
            )
                .toList(),
          ),
        ),
      ],
    );
  }
}
