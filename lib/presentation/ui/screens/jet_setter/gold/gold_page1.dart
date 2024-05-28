import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:relax_ride/presentation/ui/screens/jet_setter/gold/gold_page2.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';



class GoldPage extends StatefulWidget {
  const GoldPage({super.key});

  @override
  State<GoldPage> createState() => _GoldPageState();
}

class _GoldPageState extends State<GoldPage> {
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
                'Gold JetSetter',
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
        const SizedBox(height: 40,),
        Row(
          children: [
            const SizedBox(width: 15,),
            Container(
              decoration: BoxDecoration(
                color: AppColors.p1,
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
              child: SizedBox(
                width: 375,
                height: 250,
                 child: Column(
                   children: [
                     const SizedBox(height: 5,),
                     Text('Key Features',style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.bold,

                     ),),
                     const SizedBox(height: 5,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(left: 30.0, top: 2.0),
                           child: Icon(Icons.check_circle, size: 16, color: Colors.green),
                         ),
                         const SizedBox(width: 10),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('You can use 80% of your package'),
                             SizedBox(height: 5),
                             Text('subscription fee'),
                           ],
                         ),
                       ],
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         const SizedBox(width: 30,),
                         Padding(

                           padding: const EdgeInsets.only(right: 10.0),
                           child: Icon(Icons.check_circle, size: 16, color: Colors.green),
                         ),
                         Text('Can withdraw booking before 36 hours.'),
                       ],
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         const SizedBox(width: 30,),
                         Padding(

                           padding: const EdgeInsets.only(right: 10.0),
                           child: Icon(Icons.check_circle, size: 16, color: Colors.green),
                         ),
                         Text('Can avail 1 seat from loan facilities.'),
                       ],
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(left: 30.0, top: 2.0),
                           child: Icon(Icons.check_circle, size: 16, color: Colors.green),
                         ),
                         const SizedBox(width: 10),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('You can enjoy upto 10% discounts from '),
                             SizedBox(height: 5),
                             Text('our partners like reknowed hotels and shops'),
                           ],
                         ),
                       ],
                     ),


                   ],
                 ),

              ),
            ),



          ],
        ),
        const SizedBox(height: 40,),
        Container(
          decoration: BoxDecoration(
            color: AppColors.p1,
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
          child: SizedBox(
            width: 380,
            height: 250,
            child: Column(
              children: [
                const SizedBox(height: 5,),
                Text('Instructions',style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,

                ),),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 3),
                      child: Icon(Icons.check_circle, size: 16, color: Colors.green),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 3),
                      child: Text(
                        'Pay the subscription fee of 1000 TK \nto unlock access to Gold JetSetter benefits.',
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 3),
                      child: Icon(Icons.check_circle, size: 16, color: Colors.green),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 3),
                      child: Text(
                        'Fill the given form',
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 3), // Adjust top padding to align with the icon
                      child: Icon(Icons.check_circle, size: 16, color: Colors.green),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 3), // Adjust top padding to align with the icon
                      child: Text(
                        'Select a payment gateway.',
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 30,),
                    Padding(

                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.check_circle, size: 16, color: Colors.green),
                    ),
                    Text('Proceed to payment '),
                  ],
                ),


              ],
            ),

          ),
        ),
        const SizedBox(height: 30,),
        Container(

          child: SizedBox(
            width: 250,
            child: ElevatedButton(onPressed: (){
              Get.to(const GoldForm());
            },

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle),
                  const SizedBox(width: 5,),
                  Text('Subscribe'),
                ],
              ),),

          ),
        )
      ],
    )
    );
  }
}
