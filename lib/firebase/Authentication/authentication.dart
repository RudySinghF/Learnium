import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:quiz_app/firebase/exceptions/firebaseExceptions.dart';
import 'package:quiz_app/pages/Navigation/bottom_nav.dart';
import 'package:quiz_app/pages/getStarted.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/pages/LoginForms/login.dart';
import 'package:quiz_app/pages/otp.dart';
import 'package:quiz_app/pages/SignupForms/signup.dart';
import 'package:quiz_app/pages/scorecard.dart';
import 'package:quiz_app/pages/splash_screen.dart';

class authentication extends GetxController {
  static authentication get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      Get.offAll(() => const BottomNav());
    } else {
      Get.to(() => splashscreen());
    }
  }

  Future<void> phoneAuthentication(String phone) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (credentials) async {
        await _auth.signInWithCredential(credentials);
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'Phone number provided is not valid');
        } else {
          Get.snackbar('Error', 'Something went wrong. Please try again');
        }
      },
      codeSent: (verificationId, forceResendingToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<void> createUserWithEmailandPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const BottomNav())
          : Get.to(() => const getstarted());
    } on FirebaseAuthException catch (e) {
      final ex = signupWithEmailandPasswordexceptions.code(e.code);
      print('FIREBASE AUTH EXCEPTION-${ex.message}');
      throw ex;
    } catch (_) {
      const ex = signupWithEmailandPasswordexceptions();
      print('EXCEPTION-${ex.message}');
      throw ex;
    }
  }

  Future<void> signUserWithEmailandPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const BottomNav())
          : Get.to(() => const getstarted());
    } on FirebaseAuthException catch (e) {
      final ex = signinWithEmailandPasswordexceptions.code(e.code);
      throw ex;
    } catch (_) {
      const ex = signinWithEmailandPasswordexceptions();
      print('EXCEPTION-${ex.message}');
      throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
