import 'package:flutter/material.dart';

import '../../utility/app_colors.dart';
import '../../utility/assets_path.dart';

class DrawerItems extends StatefulWidget {
  const DrawerItems({super.key});

  @override
  State<DrawerItems> createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  @override
  bool _isProfileElevated = false;
  bool _isSettingsElevated = false;
  bool _isTermsElevated = false;
  bool _isAboutElevated = false;
  bool _isLogoutElevated = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetsPath.logo,
          height: 40,
        ),
        actions: [],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Text(
                'Navigation Drawer',
                style: TextStyle(fontSize: 20),
              ),
            ),
            _buildItem(
                Icons.person_2_outlined, ' My Profile', _isProfileElevated, () {
              setState(() {
                _isProfileElevated = !_isProfileElevated;
              });
            }),
            _buildItem(
                Icons.settings_outlined, ' Settings', _isSettingsElevated, () {
              setState(() {
                _isSettingsElevated = !_isSettingsElevated;
              });
            }),
            _buildItem(Icons.policy_outlined, ' Terms and Conditions',
                _isTermsElevated, () {
              setState(() {
                _isTermsElevated = !_isTermsElevated;
              });
            }),
            _buildItem(Icons.info_outline, ' About Us', _isAboutElevated, () {
              setState(() {
                _isAboutElevated = !_isAboutElevated;
              });
            }),
            _buildItem(Icons.logout, ' Logout', _isLogoutElevated, () {
              setState(() {
                _isLogoutElevated = !_isLogoutElevated;
              });
            }),
          ],
        ),
      ),
    );
  }
}

Widget _buildItem(
    IconData icon, String title, bool isElevated, VoidCallback onTap) {
  return Column(
    children: [
      GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 60,
          width: 70,
          decoration: BoxDecoration(
            color: AppColors.p1,
            borderRadius: BorderRadius.circular(20),
            boxShadow: isElevated
                ? [
                    BoxShadow(
                      color: Colors.grey.shade500!,
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ]
                : [],
          ),
          child: ListTile(
            leading: Icon(icon),
            title: Text(title),
          ),
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}
