import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:relax_ride/presentation/ui/controller_binder.dart';
import 'package:relax_ride/presentation/ui/screens/splash_screen.dart';
import 'package:relax_ride/presentation/ui/utility/app_theme_data.dart';

class RelaxRide extends StatelessWidget {
  const RelaxRide({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.LightThemeData,
      home: const SplashScreen(),
      initialBinding: ControllerBinder(),
    );
  }
}
