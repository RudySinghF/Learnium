import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/firebase/exceptions/firebaseExceptions.dart';
import 'package:quiz_app/firebase/models/ScoreModel.dart';
import 'package:quiz_app/firebase/models/question.dart';
import 'package:quiz_app/firebase/models/quizmodel.dart';
import 'package:quiz_app/firebase/models/user_model.dart';
import 'package:quiz_app/pages/getStarted.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/pages/LoginForms/login.dart';
import 'package:quiz_app/pages/otp.dart';
import 'package:quiz_app/pages/SignupForms/signup.dart';
import 'package:quiz_app/pages/splash_screen.dart';
import 'package:quiz_app/widgets/upcomingquiz.dart';

class QuizRepository extends GetxController {
  static QuizRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  Future<void> addQuizdata(modelquiz quiz) async {
    await _db
        .collection("Quiz")
        .add(quiz.tojson())
        .whenComplete(() => Get.snackbar("Success", "Quiz has been created",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor:
                Color.fromARGB(255, 130, 216, 133).withOpacity(0.1),
            colorText: Color.fromARGB(255, 22, 141, 26)))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Please try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color.fromARGB(255, 244, 121, 113).withOpacity(0.1),
          colorText: Color.fromARGB(255, 164, 23, 23));
      print(error.toString());
    });
  }

  Future<void> addResult(Map<String, dynamic> results) async {
    await _db
        .collection("Marks")
        .add(results)
        .whenComplete(() => Get.snackbar("Success", "Quiz has been submitted",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor:
                Color.fromARGB(255, 130, 216, 133).withOpacity(0.1),
            colorText: Color.fromARGB(255, 22, 141, 26)))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Please try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color.fromARGB(255, 244, 121, 113).withOpacity(0.1),
          colorText: Color.fromARGB(255, 164, 23, 23));
      print(error.toString());
    });
  }

  Future<List<modelquiz>> getquizdata() async {
    final snapshot = await _db.collection("Quiz").get();
    final quizData =
        snapshot.docs.map((e) => modelquiz.fromSnapshot(e)).toList();
    return quizData;
  }

  Future<modelquiz> getselectedquizdata(String id) async {
    final snapshot =
        await _db.collection("Quiz").where("QuizID", isEqualTo: id).get();
    final quizData = snapshot.docs.map((e) => modelquiz.fromSnapshot(e)).single;
    return quizData;
  }

  Future<questionmodel> getques(String ques) async {
    final snapshot = await _db
        .collection("Question")
        .where("Question", isEqualTo: ques)
        .get();
    final quizData =
        snapshot.docs.map((e) => questionmodel.fromSnapshot(e)).single;
    return quizData;
  }

  Future<questionmodel> getopt1(String op1) async {
    final snapshot = await _db
        .collection("Quiz")
        .doc()
        .collection("Question")
        .where("Option 1", isEqualTo: op1)
        .get();
    final quizData =
        snapshot.docs.map((e) => questionmodel.fromSnapshot(e)).single;
    return quizData;
  }

  Future<questionmodel> getopt2(String op2) async {
    final snapshot = await _db
        .collection("Quiz")
        .doc()
        .collection("Question")
        .where("Option 2", isEqualTo: op2)
        .get();
    final quizData =
        snapshot.docs.map((e) => questionmodel.fromSnapshot(e)).single;
    return quizData;
  }

  Future<questionmodel> getopt3(String op3) async {
    final snapshot = await _db
        .collection("Quiz")
        .doc()
        .collection("Question")
        .where("Option 3", isEqualTo: op3)
        .get();
    final quizData =
        snapshot.docs.map((e) => questionmodel.fromSnapshot(e)).single;
    return quizData;
  }

  Future<questionmodel> getopt4(String op4) async {
    final snapshot = await _db
        .collection("Quiz")
        .doc()
        .collection("Question")
        .where("Option 4", isEqualTo: op4)
        .get();
    final quizData =
        snapshot.docs.map((e) => questionmodel.fromSnapshot(e)).single;
    return quizData;
  }

  Future<questionmodel> getcorrectans(String correct) async {
    final snapshot = await _db
        .collection("Quiz")
        .doc()
        .collection("Question")
        .where("Correct answer", isEqualTo: correct)
        .get();
    final quizData =
        snapshot.docs.map((e) => questionmodel.fromSnapshot(e)).single;
    return quizData;
  }

  Future<List<questionmodel>> getspecificquesid(quizid) async {
    final snapshot =
        await _db.collection("Quiz").doc(quizid).collection("Question").get();
    final quizData =
        snapshot.docs.map((e) => questionmodel.fromSnapshot(e)).toList();
    return quizData;
  }

  Future<List<questionmodel>> getquesdata(quizid) async {
    final snapshot =
        await _db.collection("Quiz").doc(quizid).collection("Question").get();
    final quizData =
        snapshot.docs.map((e) => questionmodel.fromSnapshot(e)).toList();
    return quizData;
  }
}
