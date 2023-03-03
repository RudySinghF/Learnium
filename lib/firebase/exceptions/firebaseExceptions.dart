import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/pages/SignupForms/signup.dart';

class signupWithEmailandPasswordexceptions {
  final String message;

  const signupWithEmailandPasswordexceptions(
      [this.message = "An Unknown error occurred."]);

  factory signupWithEmailandPasswordexceptions.code(String code) {
    switch (code) {
      case 'weak-password':
        return signupWithEmailandPasswordexceptions(
            'Please enter a strong password');
      case 'invalid-email':
        return signupWithEmailandPasswordexceptions('Email entered is invalid');
      case 'email-already-in-user':
        return signupWithEmailandPasswordexceptions(
            'Email entered is already been registered');
      case 'operation-not-allowed':
        return signupWithEmailandPasswordexceptions(
            'Operation is not allowed. Please contact support');
      case 'user-disabled':
        return signupWithEmailandPasswordexceptions(
            'This user is disabled. Please contact support');
      default:
        return signupWithEmailandPasswordexceptions();
    }
  }
}

class signinWithEmailandPasswordexceptions {
  final String message;
  const signinWithEmailandPasswordexceptions(
      [this.message = "An Unknown error occurred."]);
  factory signinWithEmailandPasswordexceptions.code(String code) {
    switch (code) {
      case 'User-not-found':
        return signinWithEmailandPasswordexceptions(
            'You have not registered. Please Sign up');
      case 'invalid-email':
        return signinWithEmailandPasswordexceptions('Email entered is invalid');
      case 'Wrong-password':
        return signinWithEmailandPasswordexceptions(
            'Password Entered is wrong');
      case 'user-disabled':
        return signinWithEmailandPasswordexceptions(
            'This user is disabled. Please contact support');
      default:
        return signinWithEmailandPasswordexceptions();
    }
  }
}
