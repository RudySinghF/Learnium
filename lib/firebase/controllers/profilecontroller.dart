import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/firebase/Authentication/authentication.dart';
import 'package:quiz_app/firebase/models/user_model.dart';
import 'package:quiz_app/firebase/Repositories/userrepository.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/pages/LoginForms/login.dart';
import 'package:quiz_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  final _authRepo = Get.put(authentication());
  final _userRepo = Get.put(UserRepository());

  getUserdata() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserEmail(email);
    } else {
      Get.snackbar("Error", "Login to Continue");
    }
    final name = _authRepo.firebaseUser.value?.displayName;
    if (name != null) {
      return _userRepo.getUserName(name);
    }
    final userid = _authRepo.firebaseUser.value?.uid;
    if (userid != null) {
      return _userRepo.getUserid(userid!);
    }
  }
}
