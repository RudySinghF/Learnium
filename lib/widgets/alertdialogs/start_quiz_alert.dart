import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/firebase/Authentication/authentication.dart';
import 'package:quiz_app/firebase/controllers/profilecontroller.dart';
import 'package:quiz_app/firebase/models/user_model.dart';
import 'package:quiz_app/pages/Navigation/bottom_nav.dart';
import 'package:quiz_app/pages/startquiz.dart';
import 'package:quiz_app/widgets/content.dart';
import 'package:quiz_app/widgets/miscquiz.dart';
import 'package:quiz_app/widgets/searchbar.dart';
import 'package:quiz_app/widgets/upcomingquiz.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class StartQuizAlert extends StatefulWidget {
  final String quizid, name;
  const StartQuizAlert(this.quizid, this.name);

  @override
  State<StartQuizAlert> createState() => _StartQuizAlertState();
}

class _StartQuizAlertState extends State<StartQuizAlert> {
  late String id;
  late String time;
  int score = 0;
  int currentindex = 0;
  int incorrect = 0;
  late String username;
  @override
  void initState() {
    print("${widget.quizid}");
    print("Index${currentindex}");
    username = widget.name;
    print("${username}");
    id = widget.quizid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Start Quiz",
          style: TextStyle(
            fontFamily: GoogleFonts.rubik().fontFamily,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          )),
      content: Text("Do you want to start?",
          style: TextStyle(
            fontFamily: GoogleFonts.rubik().fontFamily,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          )),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => StartQuiz(
                          id, score, incorrect, currentindex, username))));
            },
            child: Text("Yes",
                style: TextStyle(
                  fontFamily: GoogleFonts.rubik().fontFamily,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ))),
        TextButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.black)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => BottomNav())));
            },
            child: Text("No",
                style: TextStyle(
                  fontFamily: GoogleFonts.rubik().fontFamily,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ))),
      ],
    );
  }
}
