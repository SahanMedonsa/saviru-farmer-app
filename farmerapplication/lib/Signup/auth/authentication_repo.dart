import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationReporisitory extends GetxController {
  static AuthenticationReporisitory get instance => Get.find();

  //variable
  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }
}

//function to show relative screen
screenRedirect() async {}
