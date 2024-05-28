import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:relax_ride/models/trip_model.dart' as tripModel;
import 'package:relax_ride/models/user_model.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    restoreUser();
  }

  UserModel? userDataLocal;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GetStorage box = GetStorage();

  // Box name "data" for api response cache
  void setData(String key, dynamic value) => box.write(key, value);
  void resetLogout() => box.remove("data");

  // restore user from cache
  dynamic get data => box.read("data");
  UserModel get userData => UserModel.fromJson(jsonDecode(data));

  void restoreUser() {
    if (data != null) {
      UserModel user = UserModel.fromJson(jsonDecode(data));
      userDataLocal = user;
    }
  }

  void inputClear() {
    phoneController.clear();
    fnameController.clear();
    lnameController.clear();
    cityController.clear();
    emailController.clear();
    passwordController.clear();
  }

  RxString selectedDate = "".obs;

  RxString tripId = "".obs;
  RxString userId = "".obs;
  RxString seatTaken = "".obs;
  RxInt seatTakenLength = 0.obs;
  RxDouble selectedPrice = 0.0.obs;

  RxString tripTo = "".obs;
  RxString tripFrom = "".obs;

  tripModel.Data? tripSelectedData;
}
