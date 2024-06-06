import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/Digitai_wallet/digital_wallet.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/loan/free_user/freeUserPage1.dart';
import 'package:relax_ride/loan/gold_user/goldUserPage1.dart';
import 'package:relax_ride/loan/platinum_user/platinumUserPage1.dart';
import 'package:relax_ride/presentation/ui/screens/jet_setter.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import 'home_screen.dart';

MainController mainController = Get.find();

class MainBottomNav extends StatefulWidget {
  const MainBottomNav({super.key});

  @override
  State<MainBottomNav> createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const jetSetter(),
    needLloanFoo(),
    const DigitalWallet(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(builder: (controller) {
      return Scaffold(
        body: _screens[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: controller.changeIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.man), label: 'Jetsetter'),
            BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on), label: 'Need Loan'),
            BottomNavigationBarItem(
                icon: Icon(Icons.wallet_rounded), label: 'Digital Wallet'),
          ],
        ),
      );
    });
  }
}

Widget needLloanFoo() {
  if (mainController.userData.data!.package == 0) {
    return const FreeUserP1();
  } else if (mainController.userData.data!.package == 1) {
    return const GoldUserP1();
  } else if (mainController.userData.data!.package == 2) {
    return const PlatinumUserP1();
  } else {
    return const FreeUserP1();
  }
}
