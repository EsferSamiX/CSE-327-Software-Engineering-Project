
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';

class CirculericonButton extends StatelessWidget {
  const CirculericonButton({
    super.key,
    required this.onTap,
    required this.iconData,

  });
  final VoidCallback onTap;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.grey.shade300,
        child: Icon(iconData,color: AppColors.primaryColor,size: 30,),
      ),
    );
  }
}
