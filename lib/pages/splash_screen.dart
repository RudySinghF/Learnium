import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app/pages/getStarted.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/pages/LoginForms/login.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  bool _load = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 7),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => getstarted())));
// 2. Future.delayed
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        _load = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 13, 112, 212),
              Color.fromARGB(255, 17, 54, 108)
            ])),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 210,
              ),
              VxBox(
                child: Text(
                  "Quizz",
                  style: TextStyle(
                      fontSize: 50,
                      fontFamily: GoogleFonts.nerkoOne().fontFamily,
                      fontWeight: FontWeight.bold),
                ).box.makeCentered().expand(),
              ).white.roundedFull.square(150).make(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Place to excel",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: GoogleFonts.rubik().fontFamily,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              if (_load)
                ...[]
              else ...[
                const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
