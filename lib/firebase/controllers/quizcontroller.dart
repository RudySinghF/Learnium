import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/firebase/Repositories/QuizRepository.dart';
import 'package:quiz_app/firebase/Authentication/authentication.dart';
import 'package:quiz_app/firebase/models/ScoreModel.dart';
import 'package:quiz_app/firebase/models/question.dart';
import 'package:quiz_app/firebase/models/quizmodel.dart';
import 'package:quiz_app/firebase/models/user_model.dart';
import 'package:quiz_app/firebase/Repositories/userrepository.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/pages/LoginForms/login.dart';
import 'package:quiz_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class quizcontroller extends GetxController {
  static quizcontroller get instance => Get.find();
  final url = TextEditingController();
  final description = TextEditingController();
  final name = TextEditingController();
  final _quizRepo = Get.put(QuizRepository());
  final _authRepo = Get.put(authentication());

  Future<void> inputquizdata(modelquiz quiz) async {
    await _quizRepo.addQuizdata(quiz);
  }

  Future<void> uploadresult(Map<String, dynamic> quesdata) async {
    await _quizRepo.addResult(quesdata);
  }

  Future<List<modelquiz>> getQuizdata() async {
    return await _quizRepo.getquizdata();
  }

  getselectedqdata(String quizid) async {
    return await _quizRepo.getselectedquizdata(quizid);
  }

  getques(String ques) async {
    return await _quizRepo.getques(ques);
  }

  getop1(String op1) async {
    return await _quizRepo.getopt1(op1);
  }

  getop2(String op2) async {
    return await _quizRepo.getopt2(op2);
  }

  getop3(String op3) async {
    return await _quizRepo.getopt3(op3);
  }

  getop4(String op4) async {
    return await _quizRepo.getopt1(op4);
  }

  getcorrect(String correct) async {
    return await _quizRepo.getcorrectans(correct);
  }

  getSpecificquesid(String id) async {
    return await _quizRepo.getspecificquesid(id);
  }

  Future<List<questionmodel>> getQuesdata(String ques) async {
    return await _quizRepo.getquesdata(ques);
  }
}
