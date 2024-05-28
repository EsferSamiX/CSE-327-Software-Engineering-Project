import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/presentation/ui/screens/available_trips.dart';
import 'package:relax_ride/presentation/ui/screens/carousel_banner.dart';
import 'package:relax_ride/presentation/ui/screens/welcome.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';

import '../../../notifications/notifications.dart';
import '../utility/assets_path.dart';
import '../utility/circle_icon_button.dart';
import 'drawer_screens/about_us.dart';
import 'drawer_screens/my_profile.dart';
import 'drawer_screens/settings.dart';
import 'drawer_screens/terms_n_conditions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MainController mainController = Get.put(MainController());

  TextEditingController _dateController = TextEditingController();
  String selectedDestination = 'Chittagong';
  String selectedDeparture = 'Dhaka';

  bool _isProfileElevated = false;
  bool _isSettingsElevated = false;
  bool _isTermsElevated = false;
  bool _isAboutElevated = false;
  bool _isLogoutElevated = false;

  //
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Image.asset(
          AssetsPath.logo,
          height: 40,
        ),

        actions: [
          CirculericonButton(
            onTap: () {
              Get.to(() => const Notifications());
            },
            iconData: Icons.notifications_active_outlined,
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
              ),
              accountName: Text(
                mainController.userData.data!.fname.toString() +
                    mainController.userData.data!.lname.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              accountEmail: Text(
                mainController.userData.data!.email.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/user1.png'),
              ),
            ),
            _buildItem(
                Icons.person_2_outlined, ' My Profile', _isProfileElevated, () {
              setState(() {
                _isProfileElevated = !_isProfileElevated;
              });
              Get.to(() => const MyProfile());
            }),
            _buildItem(
                Icons.settings_outlined, ' Settings', _isSettingsElevated, () {
              setState(() {
                _isSettingsElevated = !_isSettingsElevated;
              });
              Get.to(() => const Settings());
            }),
            _buildItem(Icons.policy_outlined, ' Terms and Conditions',
                _isTermsElevated, () {
              setState(() {
                _isTermsElevated = !_isTermsElevated;
              });
              Get.to(() => const TermsNConditions());
            }),
            _buildItem(Icons.info_outline, ' About Us', _isAboutElevated, () {
              setState(() {
                _isAboutElevated = !_isAboutElevated;
              });
              Get.to(() => const AboutUs());
            }),
            _buildItem(Icons.logout, ' Logout', _isLogoutElevated, () {
              setState(() {
                _isLogoutElevated = !_isLogoutElevated;
              });
              Get.offAll(() => const WelcomePage());
              Future.delayed(const Duration(milliseconds: 200), () {
                mainController.resetLogout();
              });
            }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CarouselBanner(),
            const SizedBox(height: 20),
            Container(
              //color: AppColors.p1,
              decoration: BoxDecoration(
                color: AppColors.p1,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SizedBox(
                width: 350,
                height: 220,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '  To',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  AssetsPath.to,
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(width: 5),
                                SizedBox(
                                  width: 135,
                                  child: DropdownButton<String>(
                                    hint: const Text('Destination'),
                                    value: selectedDestination,
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedDestination =
                                            newValue.toString();
                                      });
                                    },
                                    items: [
                                      'Chittagong',
                                      'Cox\'s Bazar',
                                      'Noakhali',
                                      'Khulna'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                            const Text(
                              'From',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  AssetsPath.from,
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(width: 5),
                                SizedBox(
                                  width: 135,
                                  child: DropdownButton<String>(
                                    // hint: Text('Departure'),
                                    value: selectedDeparture,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedDeparture = newValue.toString();
                                      });
                                    },
                                    items: [
                                      'Dhaka',
                                      'Chittagong',
                                      'Cox\'s Bazar',
                                      'Noakhali',
                                      'Khulna'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 100),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                color: AppColors.p2,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SizedBox(
                width: 350,
                height: 85,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                      labelText: 'Date',
                      labelStyle: TextStyle(fontSize: 15, color: Colors.black),
                      prefixIcon: Icon(
                        Icons.calendar_today,
                      ),
                      prefixIconColor: Colors.black,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectDate(context);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 45),
            SizedBox(
              width: 350,
              child: ElevatedButton(
                style: _dateController.text == ""
                    ? ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      )
                    : ElevatedButton.styleFrom(),
                onPressed: () {
                  if (_dateController.text == "") {
                    Get.snackbar(
                      "Field Missing!",
                      "Please select a date!",
                      colorText: Colors.black,
                    );
                    return;
                  }
                  debugPrint('Selected Departure: $selectedDeparture');
                  Get.to(() => AvailableTrips(
                        from: selectedDeparture,
                        to: selectedDestination,
                        selectedData:
                            _dateController.text.toString().split(',')[1],
                      ));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search),
                    Text('Search'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2040),
    );
    if (_picked != null) {
      setState(() {
        _dateController.text = DateFormat('EEEE, d MMMM yyyy').format(_picked);
      });
    }
  }
}

Widget _buildItem(
    IconData icon, String title, bool isElevated, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 60,
          width: 277,
          decoration: BoxDecoration(
            color: AppColors.p1,
            borderRadius: BorderRadius.circular(20),
            boxShadow: isElevated
                ? [
                    BoxShadow(
                      color: Colors.grey.shade500,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Icon(icon),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    ),
  );
}
