import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:relax_ride/Digitai_wallet/digital_wallet.dart';
import 'package:relax_ride/presentation/ui/screens/jet_setter.dart';
import 'package:relax_ride/presentation/ui/screens/loan.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import 'home_screen.dart';

class MainBottomNav extends StatefulWidget {
  const MainBottomNav({super.key});

  @override
  State<MainBottomNav> createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  final List<Widget> _screens = const [
    HomeScreen(),
    jetSetter(),
    NeedLloan(),
    DigitalWallet(),
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
