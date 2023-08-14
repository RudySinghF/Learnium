import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quiz_app/firebase/controllers/signupcontroller.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/pages/LoginForms/login.dart';
import 'package:quiz_app/pages/otp.dart';
import 'package:quiz_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class signupphone extends StatefulWidget {
  const signupphone({super.key});

  @override
  State<signupphone> createState() => _signupphoneState();
}

final controller = Get.put(signupcontroller());
final _formkeysignup = GlobalKey<FormState>();

class _signupphoneState extends State<signupphone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   height: 50,
                          // ),
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
                  Text("Sign up",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: GoogleFonts.manrope().fontFamily,
                          fontWeight: FontWeight.normal)),
                  SizedBox(height: 20),
                  Form(
                    // autovalidateMode: AutovalidateMode.always,
                    key: _formkeysignup,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 2))
                              ],
                            ),
                            height: 55,
                            width: 500,
                            child: TextFormField(
                              controller: controller.name,
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return "  * Required";
                              //   }
                              //   return null;
                              // },
                              keyboardType: TextInputType.name,
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Color.fromARGB(255, 15, 82, 182),
                                  ),
                                  hintText: 'Enter name',
                                  hintStyle: TextStyle(
                                      color: Colors.black38,
                                      fontFamily:
                                          GoogleFonts.rubik().fontFamily,
                                      fontSize: 15)),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 2))
                              ],
                            ),
                            height: 55,
                            width: 500,
                            child: TextFormField(
                              controller: controller.phone,
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return "  * Required";
                              //   }
                              //   return null;
                              // },
                              // keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.call,
                                    color: Color.fromARGB(255, 15, 82, 182),
                                  ),
                                  hintText: 'Enter phone number',
                                  hintStyle: TextStyle(
                                      color: Colors.black38,
                                      fontFamily:
                                          GoogleFonts.rubik().fontFamily,
                                      fontSize: 15)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
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
                            if (_formkeysignup.currentState!.validate()) {
                              signupcontroller.instance.phoneAuthentication(
                                  controller.phone.text.trim());
                              Get.to(() => const otp());
                            }
                          },
                          // => movetohome(context),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 15, 82, 182),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          // child: loginload
                          //     ? CircularProgressIndicator(
                          //         color: Colors.white,
                          //         strokeWidth: 2,
                          //       )
                          child: Text(
                            "Create account",
                            style: TextStyle(
                                fontFamily: GoogleFonts.manrope().fontFamily,
                                fontSize: 13,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ?",
                        style: TextStyle(
                            fontFamily: GoogleFonts.rubik().fontFamily,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 13),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => login())));
                        },
                        child: Text("  Sign in",
                            style: TextStyle(
                                fontFamily: GoogleFonts.rubik().fontFamily,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Color.fromARGB(255, 15, 82, 182))),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
