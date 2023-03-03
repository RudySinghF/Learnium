import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/firebase/Authentication/authentication.dart';
import 'package:quiz_app/firebase/controllers/profilecontroller.dart';
import 'package:quiz_app/firebase/controllers/quizcontroller.dart';
import 'package:quiz_app/firebase/models/question.dart';
import 'package:quiz_app/firebase/models/quizmodel.dart';
import 'package:quiz_app/firebase/models/user_model.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/pages/scorecard.dart';
import 'package:quiz_app/pages/startquiz.dart';
import 'package:quiz_app/widgets/content.dart';
import 'package:quiz_app/widgets/miscquiz.dart';
import 'package:quiz_app/widgets/searchbar.dart';
import 'package:quiz_app/widgets/show_questions.dart';
import 'package:quiz_app/widgets/upcomingquiz.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class QandA extends StatefulWidget {
  final String nameofquiz;
  final String name;
  final int marks;
  final String id;
  final String question,
      option1,
      option2,
      option3,
      option4,
      questionid,
      correct;
  final int index;
  final int length;
  const QandA(
      this.question,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.questionid,
      this.correct,
      this.marks,
      this.id,
      this.index,
      this.length,
      this.name,
      this.nameofquiz);

  @override
  State<QandA> createState() => _QandAState();
}

class _QandAState extends State<QandA> {
  late String opt1, opt2, opt3, opt4, ques, correctopt, quizid, id;
  late int score;
  late int currentindex;
  late String username;
  late int quizlength;
  late String exam;
  final showques = Get.put(quizcontroller());
  final getquizid = Get.put(quizcontroller());
  String optselected = "";

  int tapped = 0;
  bool opt1selected = false;
  bool opt2selected = false;
  bool opt3selected = false;
  bool opt4selected = false;
  void initState() {
    score = widget.marks;
    print("Score${score}");
    quizid = widget.id;
    ques = widget.question;
    opt1 = widget.option1;
    opt2 = widget.option2;
    opt3 = widget.option3;
    opt4 = widget.option4;
    correctopt = widget.correct;
    currentindex = widget.index;
    quizlength = widget.length;
    username = widget.name;
    exam = widget.nameofquiz;
    print("Length${quizlength}");
    print("${username}");
    print("${exam}");
    id = widget.questionid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: showques.getSpecificquesid(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.550,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 0.1,
                          blurRadius: 1)
                    ]),
                child: Column(children: [
                  Form(
                      child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 13, 112, 212),
                                Color.fromARGB(255, 17, 54, 108)
                              ]),
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(8)),
                        ),
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(children: [
                          Text("Q.",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.rubik().fontFamily,
                                  fontSize: 16,
                                  color: Colors.white
                                  // fontWeight: FontWeight.bold
                                  )),
                          SizedBox(
                            width: 7,
                          ),
                          Text(ques,
                              style: TextStyle(
                                  fontFamily: GoogleFonts.rubik().fontFamily,
                                  fontSize: 16,
                                  color: Colors.white
                                  // fontWeight: FontWeight.bold
                                  ))
                        ]),
                        padding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text("A)",
                              style: TextStyle(
                                fontFamily: GoogleFonts.rubik().fontFamily,
                                fontSize: 13,
                                // fontWeight: FontWeight.bold
                              )),
                          padding: EdgeInsets.symmetric(horizontal: 8),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        GestureDetector(
                          onTap: () {
                            opt1 = widget.option1;
                            optselected = opt1;
                            tapped++;
                            print("Tap?${tapped}");
                            if (optselected == correctopt) {
                              opt1selected = true;
                              opt2selected = false;
                              opt4selected = false;
                              opt3selected = false;
                              score = score + 1;
                              if (currentindex == quizlength - 1) {
                                setState(() {
                                  print("Score${score}");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => ScoreCard(
                                              score,
                                              quizlength,
                                              username,
                                              exam))));
                                });
                              } else {
                                setState(() {
                                  print("Score${score}");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => StartQuiz(
                                              quizid,
                                              score,
                                              currentindex + 1,
                                              username))));
                                });
                              }
                              // optselected = "";
                            } else {
                              opt1selected = true;
                              opt2selected = false;
                              opt4selected = false;
                              opt3selected = false;

                              if (currentindex == quizlength - 1) {
                                setState(() {
                                  print("Score${score}");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => ScoreCard(
                                              score,
                                              quizlength,
                                              username,
                                              exam))));
                                });
                              } else {
                                setState(() {
                                  print("Score${score}");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => StartQuiz(
                                              quizid,
                                              score,
                                              currentindex + 1,
                                              username))));
                                });
                              }
                              // optselected = "";
                            }
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: opt1selected ? Colors.green : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 2))
                              ],
                            ),
                            height: 50,
                            width: 200,
                            child: Text(
                              opt1,
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontFamily: GoogleFonts.rubik().fontFamily,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 15,
                      ),
                      Row(children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text("B)",
                              style: TextStyle(
                                fontFamily: GoogleFonts.rubik().fontFamily,
                                fontSize: 13,
                                // fontWeight: FontWeight.bold
                              )),
                          padding: EdgeInsets.symmetric(horizontal: 8),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        GestureDetector(
                          onTap: () {
                            opt2 = widget.option2;
                            optselected = opt2;
                            tapped++;
                            print("Tap?${tapped}");
                            if (optselected == correctopt) {
                              opt2selected = true;
                              opt1selected = false;
                              opt4selected = false;
                              opt3selected = false;
                              score = score + 1;

                              if (currentindex == quizlength - 1) {
                                setState(() {
                                  print("Score${score}");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => ScoreCard(
                                              score,
                                              quizlength,
                                              username,
                                              exam))));
                                });
                              } else {
                                setState(() {
                                  print("Score${score}");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => StartQuiz(
                                              quizid,
                                              score,
                                              currentindex + 1,
                                              username))));
                                });
                              }
                              // optselected = "";
                            } else {
                              opt2selected = true;
                              opt1selected = false;
                              opt4selected = false;
                              opt3selected = false;

                              if (currentindex == quizlength - 1) {
                                setState(() {
                                  print("Score${score}");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => ScoreCard(
                                              score,
                                              quizlength,
                                              username,
                                              exam))));
                                });
                              } else {
                                setState(() {
                                  print("Score${score}");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => StartQuiz(
                                              quizid,
                                              score,
                                              currentindex + 1,
                                              username))));
                                });
                              }

                              // optselected = "";
                            }
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: opt2selected ? Colors.green : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 2))
                              ],
                            ),
                            height: 50,
                            width: 200,
                            child: Text(
                              opt2,
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontFamily: GoogleFonts.rubik().fontFamily,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 15,
                      ),
                      Row(children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text("C)",
                              style: TextStyle(
                                fontFamily: GoogleFonts.rubik().fontFamily,
                                fontSize: 13,
                                // fontWeight: FontWeight.bold
                              )),
                          padding: EdgeInsets.symmetric(horizontal: 8),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        GestureDetector(
                          onTap: () {
                            opt3 = widget.option3;
                            optselected = opt3;
                            tapped++;
                            print("Tap?${tapped}");
                            if (optselected == correctopt && tapped < 2) {
                              opt3selected = true;
                              opt1selected = false;
                              opt2selected = false;
                              opt4selected = false;
                              score = score + 1;

                              if (currentindex == quizlength - 1) {
                                setState(() {
                                  print("Score${score}");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => ScoreCard(
                                              score,
                                              quizlength,
                                              username,
                                              exam))));
                                });
                              } else {
                                setState(() {
                                  print("Score${score}");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => StartQuiz(
                                              quizid,
                                              score,
                                              currentindex + 1,
                                              username))));
                                });
                              }
                              // optselected = "";
                            } else {
                              opt3selected = true;
                              opt1selected = false;
                              opt2selected = false;
                              opt4selected = false;

                              if (currentindex == quizlength - 1) {
                                setState(() {
                                  print("Score${score}");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => ScoreCard(
                                              score,
                                              quizlength,
                                              username,
                                              exam))));
                                });
                              } else {
                                setState(() {
                                  print("Score${score}");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => StartQuiz(
                                              quizid,
                                              score,
                                              currentindex + 1,
                                              username))));
                                });
                              }
                              // optselected = "";
                            }
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: opt3selected ? Colors.green : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 2))
                              ],
                            ),
                            height: 50,
                            width: 200,
                            child: Text(
                              opt3,
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontFamily: GoogleFonts.rubik().fontFamily,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text("D)",
                                style: TextStyle(
                                  fontFamily: GoogleFonts.rubik().fontFamily,
                                  fontSize: 13,
                                  // fontWeight: FontWeight.bold
                                )),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          GestureDetector(
                            onTap: () {
                              opt4 = widget.option4;
                              optselected = opt4;
                              print("Tap?${tapped}");
                              tapped++;
                              if (optselected == correctopt) {
                                opt4selected = true;
                                opt1selected = false;
                                opt2selected = false;
                                opt3selected = false;
                                score = score + 1;

                                if (currentindex == quizlength - 1) {
                                  setState(() {
                                    print("Score${score}");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => ScoreCard(
                                                score,
                                                quizlength,
                                                username,
                                                exam))));
                                  });
                                } else {
                                  setState(() {
                                    print("Score${score}");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => StartQuiz(
                                                quizid,
                                                score,
                                                currentindex + 1,
                                                username))));
                                  });
                                }
                                // optselected = "";
                              } else {
                                opt4selected = true;
                                opt1selected = false;
                                opt2selected = false;
                                opt3selected = false;

                                if (currentindex == quizlength - 1) {
                                  setState(() {
                                    print("Score${score}");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => ScoreCard(
                                                score,
                                                quizlength,
                                                username,
                                                exam))));
                                  });
                                } else {
                                  setState(() {
                                    print("Score${score}");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => StartQuiz(
                                                quizid,
                                                score,
                                                currentindex + 1,
                                                username))));
                                  });
                                }
                                // optselected = "";
                              }
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color:
                                    opt4selected ? Colors.green : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      offset: Offset(0, 2))
                                ],
                              ),
                              height: 50,
                              width: 200,
                              child: Text(
                                opt4,
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontFamily: GoogleFonts.rubik().fontFamily,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
                ]));
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
      },
    );
  }
}
