import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presentation/ui/utility/app_colors.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
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
                  'Transactions',
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
          const SizedBox(height: 2,),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemExtent: 100,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: AppColors.p1,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    title: Text('Add Money ${index + 1}'),
                    subtitle: Text('Description of transcations ${index + 1}'),
                    leading: Icon(Icons.notifications_active_rounded),
                    onTap: () {
                      // Handle onTap event
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


