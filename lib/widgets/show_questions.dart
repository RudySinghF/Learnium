import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/firebase/Authentication/authentication.dart';
import 'package:quiz_app/firebase/controllers/profilecontroller.dart';
import 'package:quiz_app/firebase/controllers/quizcontroller.dart';
import 'package:quiz_app/firebase/models/user_model.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/widgets/content.dart';
import 'package:quiz_app/widgets/miscquiz.dart';
import 'package:quiz_app/widgets/searchbar.dart';
import 'package:quiz_app/widgets/upcomingquiz.dart';
import 'package:random_string/random_string.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

import '../pages/QandA.dart';
import '../pages/startquiz.dart';

class Show_questions extends StatefulWidget {
  final String quizid;
  final int marks, index;
  final String name;
  final String nameofquiz;
  const Show_questions(
      this.quizid, this.marks, this.index, this.name, this.nameofquiz);

  @override
  State<Show_questions> createState() => _Show_questionsState();
}

class _Show_questionsState extends State<Show_questions> {
  late String id, opt1, opt2, opt3, opt4, ques, correctopt;
  late String quesid;
  late String exam;
  late String username;

  final showques = Get.put(quizcontroller());

  final user = Get.put(ProfileController());
  final getquesid = Get.put(quizcontroller());
  late String userid;
  bool answeredcorrect = false;
  late int length;
  bool answered = false;
  String optselected = "";
  late int score, currentindex;
  @override
  void initState() {
    print("${widget.quizid}");
    id = widget.quizid;
    score = widget.marks;
    currentindex = widget.index;
    username = widget.name;
    exam = widget.nameofquiz;
    print("Score${score}");
    print("Index${currentindex}");
    print("${username}");
    print("${exam}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: MediaQuery.of(context).size.height * 0.600,
      width: MediaQuery.of(context).size.width * 0.9,
      child: FutureBuilder(
          future: showques.getQuesdata(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                ques = snapshot.data![currentindex].question;
                opt1 = snapshot.data![currentindex].op1;
                opt2 = snapshot.data![currentindex].op2;
                opt3 = snapshot.data![currentindex].op3;
                opt4 = snapshot.data![currentindex].op4;
                quesid = snapshot.data![currentindex].id!;
                correctopt = snapshot.data![currentindex].correctanswer;
                length = snapshot.data!.length;
                return QandA(ques, opt1, opt2, opt3, opt4, quesid, correctopt,
                    score, id, currentindex, length, username, exam);
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return Center(
                  child: Text("Something went wrong"),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
