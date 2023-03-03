import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/firebase/controllers/otpcontroller.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/pages/SignupForms/signup.dart';
import 'package:quiz_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

var optcontroller = Get.put(OtpController());
var otpc;

class _otpState extends State<otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [
                  Color.fromARGB(255, 13, 112, 212),
                  Color.fromARGB(255, 17, 54, 108)
                ])),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.300,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      VxBox(
                        child: Text(
                          "Quizz",
                          style: TextStyle(
                              fontSize: 36,
                              fontFamily: GoogleFonts.nerkoOne().fontFamily,
                              fontWeight: FontWeight.bold),
                        ).box.makeCentered().expand(),
                      ).white.roundedFull.square(120).make(),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.530,
                  child: Column(children: [
                    Text("Verification",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: GoogleFonts.manrope().fontFamily,
                            fontWeight: FontWeight.normal)),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Enter the verification code sent at",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: GoogleFonts.manrope().fontFamily,
                            fontWeight: FontWeight.normal)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("test@gmail.com",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: GoogleFonts.manrope().fontFamily,
                            fontWeight: FontWeight.normal)),
                    SizedBox(
                      height: 25,
                    ),
                    OtpTextField(
                      numberOfFields: 6,
                      fillColor: Colors.white,
                      filled: true,
                      showFieldAsBox: true,
                      enabledBorderColor: Colors.white,
                      onSubmit: (code) {
                        otpc = code;
                        OtpController.instance.verifyOTP(otpc);
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {
                            OtpController.instance.verifyOTP(otpc);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text(
                            "Verify",
                            style: TextStyle(
                              fontFamily: GoogleFonts.rubik().fontFamily,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 21, 104, 229),
                              fontSize: 15,
                            ),
                          )),
                    )
                  ]),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
