import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const RelaxRide());
}
