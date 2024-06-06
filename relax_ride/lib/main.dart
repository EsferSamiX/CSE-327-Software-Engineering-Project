import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:relax_ride/local_notification/local_notification.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await GetStorage.init();
  await CustomLocalNotification().initialize();
  runApp(const RelaxRide());
}
