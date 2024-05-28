import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:relax_ride/Digitai_wallet/donation_payment.dart';

import '../presentation/ui/utility/app_colors.dart';

class Donation extends StatefulWidget {
  const Donation({super.key});

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
            child: Row(
              children: [
                const SizedBox(height: 30,),
                Text(
                  'Donation',
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
                'Select a charity organiztion',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50,),
          RadioWidget(),
          const SizedBox(height: 50,),
          SizedBox(
            width: 380,
            height: 50,
            child: ElevatedButton(
              onPressed: (){
                Get.to(DonationPayment());
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: AppColors.primaryColor,
              ),
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40,),
        ],
      ),
    );
  }
}

class Organizations {
  final String name;
  final String imagePath;

  Organizations(this.name, this.imagePath);
}

class RadioWidget extends StatefulWidget {
  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  Organizations? _selectedOrganization;

  final List<Organizations> charityOrganizatios = [
    Organizations('As Sunnah Foundation', 'assets/images/as_sunnah.png'),
    Organizations('Brac', 'assets/images/brac1.png'),
    Organizations('Bidda Nondo', 'assets/images/bidda.png'),
    Organizations('Sajida Foundation', 'assets/images/sajida111.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _selectedOrganization != null
            ? Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_selectedOrganization!.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(_selectedOrganization!.name),
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
            children: charityOrganizatios
                .map(
                  (method) => RadioListTile<Organizations>(
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
                groupValue: _selectedOrganization,
                onChanged: (Organizations? value) {
                  setState(() {
                    _selectedOrganization = value;
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
