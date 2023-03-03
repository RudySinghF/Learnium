import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/firebase/Authentication/authentication.dart';
import 'package:quiz_app/firebase/models/user_model.dart';
import 'package:quiz_app/firebase/Repositories/userrepository.dart';
import 'package:random_string/random_string.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/pages/LoginForms/login.dart';
import 'package:quiz_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class signupcontroller extends GetxController {
  static signupcontroller get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final userRepo = Get.put(UserRepository());

  void registeruser(String email, String password) {
    authentication.instance.createUserWithEmailandPassword(email, password);
  }

  void phoneAuthentication(String phone) {
    authentication.instance.phoneAuthentication(phone);
  }

  Future<void> createUser(Usermodel user) async {
    await userRepo.createUser(user);
    registeruser(user.email, user.password);
  }

  void userlogin(String email, String password) {
    authentication.instance.signUserWithEmailandPassword(email, password);
  }
}
