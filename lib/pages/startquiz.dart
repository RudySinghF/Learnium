import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/firebase/Authentication/authentication.dart';
import 'package:quiz_app/firebase/controllers/profilecontroller.dart';
import 'package:quiz_app/firebase/controllers/quizcontroller.dart';
import 'package:quiz_app/firebase/models/question.dart';
import 'package:quiz_app/firebase/models/quizmodel.dart';
import 'package:quiz_app/firebase/models/user_model.dart';
import 'package:quiz_app/pages/QandA.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/widgets/content.dart';
import 'package:quiz_app/widgets/miscquiz.dart';
import 'package:quiz_app/widgets/searchbar.dart';
import 'package:quiz_app/widgets/show_questions.dart';
import 'package:quiz_app/widgets/upcomingquiz.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class StartQuiz extends StatefulWidget {
  final String id;
  final int marks, wrong;
  final int index;
  final String name;
  const StartQuiz(
    this.id,
    this.marks,
    this.wrong,
    this.index,
    this.name,
  );

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  late String id, opt1, opt2, opt3, opt4, ques, correctopt, optselected;
  late int currentindex;
  late String quesid;
  late String quizid;
  late String username;
  final showques = Get.put(quizcontroller());
  final user = Get.put(ProfileController());
  late int score, incorrect;
  @override
  void initState() {
    print("${widget.id}");
    quizid = widget.id;
    score = widget.marks;
    incorrect = widget.wrong;
    currentindex = widget.index;
    username = widget.name;
    print("QuizAPP${score}");
    print("Index${currentindex}");
    print("${username}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: showques.getselectedqdata(quizid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              // optselected = "";
              modelquiz quizdetails = snapshot.data as modelquiz;
              return Scaffold(
                  body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            height: MediaQuery.of(context).size.height * 0.100,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  quizdetails.quizname,
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Show_questions(quizid, score, incorrect, currentindex,
                              username, quizdetails.quizname),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
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
        });
  }
}
