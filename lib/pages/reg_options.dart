import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quiz_app/firebase/controllers/signupcontroller.dart';
import 'package:quiz_app/pages/getStarted.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/pages/LoginForms/login.dart';
import 'package:quiz_app/pages/otp.dart';
import 'package:quiz_app/pages/SignupForms/signup.dart';
import 'package:quiz_app/pages/SignupForms/signup_phone.dart';
import 'package:quiz_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class registeroptions extends StatefulWidget {
  const registeroptions({super.key});

  @override
  State<registeroptions> createState() => _registeroptionsState();
}

class _registeroptionsState extends State<registeroptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.270,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomRight,
                            colors: [
                          Color.fromARGB(255, 13, 112, 212),
                          Color.fromARGB(255, 17, 54, 108)
                        ])),
                    child: Column(children: [
                      SizedBox(
                        height: 50,
                      ),
                      VxBox(
                        child: Text(
                          "Le",
                          style: TextStyle(
                              fontSize: 38,
                              fontFamily: GoogleFonts.nerkoOne().fontFamily,
                              fontWeight: FontWeight.bold),
                        ).box.makeCentered().expand(),
                      ).white.roundedFull.square(100).make(),
                    ]),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text("Sign Up",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: GoogleFonts.manrope().fontFamily,
                          fontWeight: FontWeight.normal)),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 50,
                      width: 250,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 3),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => signup())));
                          },
                          // => movetohome(context),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 15, 82, 182),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text(
                            "Register via email",
                            style: TextStyle(
                                fontFamily: GoogleFonts.manrope().fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 50,
                      width: 250,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 3),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => signupphone())));
                          },
                          // => movetohome(context),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 15, 82, 182),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text(
                            "Register via mobile number",
                            style: TextStyle(
                                fontFamily: GoogleFonts.manrope().fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 50,
                      width: 150,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 3),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => getstarted())));
                            },
                            // => movetohome(context),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.navigate_before,
                                  color: Colors.black,
                                ),
                                Text(
                                  "Go Back",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
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
    );
  }
}
