import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/firebase/Authentication/authentication.dart';
import 'package:quiz_app/firebase/controllers/profilecontroller.dart';
import 'package:quiz_app/firebase/controllers/quizcontroller.dart';
import 'package:quiz_app/firebase/models/ScoreModel.dart';
import 'package:quiz_app/firebase/models/user_model.dart';
import 'package:quiz_app/pages/Navigation/bottom_nav.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/widgets/content.dart';
import 'package:quiz_app/widgets/miscquiz.dart';
import 'package:quiz_app/widgets/searchbar.dart';
import 'package:quiz_app/widgets/upcomingquiz.dart';
import 'package:random_string/random_string.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class ScoreCard extends StatefulWidget {
  final int marks, length;
  final String name;
  final String nameofquiz;
  const ScoreCard(this.marks, this.length, this.name, this.nameofquiz);

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  final controller = Get.put(quizcontroller());
  late int finalmarks, quizlength;
  late String username;
  late String exam;
  String scoreid = randomAlphaNumeric(20);
  void initState() {
    finalmarks = widget.marks;
    print("FinalMakrs${finalmarks}");
    quizlength = widget.length;
    username = widget.name;
    exam = widget.nameofquiz;
    print("${username}");
    print("${exam}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    height: MediaQuery.of(context).size.height * 0.100,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Result",
                          style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    height: MediaQuery.of(context).size.height * 0.500,
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade600,
                              spreadRadius: 0.1,
                              blurRadius: 1)
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          child: Center(
                            child: Text("Your Score:",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.montserrat().fontFamily,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Center(
                              child: Text("${finalmarks}/${quizlength}",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black))),
                        ),
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: SizedBox(
                                        height: 40,
                                        width: 120,
                                        child: AnimatedContainer(
                                          duration: Duration(seconds: 3),
                                          child: ElevatedButton(
                                              onPressed: () {
                                                Map<String, String> results = {
                                                  "Student Name": username,
                                                  "Exam": exam,
                                                  "Marks":
                                                      finalmarks.toString(),
                                                  "Total Questions":
                                                      quizlength.toString(),
                                                };

                                                quizcontroller.instance
                                                    .uploadresult(results);
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: ((context) =>
                                                            BottomNav())));
                                              },
                                              // => movetohome(context),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30))),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.navigate_before,
                                                    color: Colors.black,
                                                  ),
                                                  Text(
                                                    "Go Home",
                                                    style: TextStyle(
                                                        fontFamily: GoogleFonts
                                                                .montserrat()
                                                            .fontFamily,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
