import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/presentation/ui/screens/jet_setter/gold/gold_page3.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';

import '../../../loan/free_user/freeUserPage1.dart';
import '../../../loan/gold_user/goldUserPage1.dart';
import '../../../loan/platinum_user/platinumUserPage1.dart';

class NeedLloan extends StatefulWidget {
  const NeedLloan({super.key});

  @override
  State<NeedLloan> createState() => _NeedLloanState();
}

class _NeedLloanState extends State<NeedLloan> {
  MainController mainController = Get.find();

  @override
  void initState() {
    super.initState();
    if (mainController.userData.data!.package == 0) {
      Get.to(() => const FreeUserP1());
    } else if (mainController.userData.data!.package == 2) {
      Get.to(() => const GoldUserP1());
    } else if (mainController.userData.data!.package == 3) {
      Get.to(() => const PlatinumUserP1());
    } else {
      Get.to(() => const FreeUserP1());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
