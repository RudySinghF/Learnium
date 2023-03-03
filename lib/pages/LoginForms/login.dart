import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/firebase/controllers/signupcontroller.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/pages/reg_options.dart';
import 'package:quiz_app/pages/SignupForms/signup.dart';
import 'package:quiz_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  // bool loginload = false;
  // auth authservice = new auth();
  // String email;
  // String password;
  // _loginState({required this.email, required this.password});

  // movetohome(BuildContext context) async {
  //   if (_formkey.currentState!.validate()) {
  //     authservice.signin(email, password).then((value) {
  //       if (value != null) {
  //         setState(() {
  //           loginload = false;
  //         });
  //         // Navigator.pushReplacement(
  //         //     context, MaterialPageRoute(builder: ((context) => homepage())));
  //       }
  //     });
  //     setState(() {
  //       loginload = true;
  //     });
  //     await Future.delayed(Duration(seconds: 3));
  //     await Navigator.pushNamed(context, myroutes.homeroute);
  //     setState(() {
  //       loginload = false;
  //     });
  //   }
  // }

  final _formkey = GlobalKey<FormState>();
  final controller = Get.put(signupcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 144, 198, 255),
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
                          "Quizz",
                          style: TextStyle(
                              fontSize: 32,
                              fontFamily: GoogleFonts.nerkoOne().fontFamily,
                              fontWeight: FontWeight.bold),
                        ).box.makeCentered().expand(),
                      ).white.roundedFull.square(100).make(),
                    ]),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text("Sign In",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: GoogleFonts.manrope().fontFamily,
                          fontWeight: FontWeight.normal)),
                  SizedBox(height: 30),
                  Form(
                    // autovalidateMode: AutovalidateMode.always,
                    key: _formkey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text("Email",
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.rubik().fontFamily,
                                    fontSize: 13,
                                    // fontWeight: FontWeight.bold
                                  ))),
                          SizedBox(
                            height: 7,
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
                              controller: controller.email,
                              // onChanged: (value) {
                              //   value = email;
                              // },
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return "  * Required";
                              //   }
                              //   return null;
                              // },
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Color.fromARGB(255, 15, 82, 182),
                                  ),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      color: Colors.black38,
                                      fontFamily:
                                          GoogleFonts.rubik().fontFamily,
                                      fontSize: 15)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Password",
                                style: TextStyle(
                                  fontFamily: GoogleFonts.rubik().fontFamily,
                                  fontSize: 13,
                                  // fontWeight: FontWeight.bold
                                ),
                              )),
                          SizedBox(
                            height: 7,
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
                              controller: controller.password,
                              // onChanged: (value) {
                              //   value = password;
                              // },
                              obscureText: true,
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Color.fromARGB(255, 15, 82, 182),
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color: Colors.black38,
                                      fontFamily:
                                          GoogleFonts.rubik().fontFamily,
                                      fontSize: 15)),
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return "  * Required";
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                        ],
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
                            if (_formkey.currentState!.validate()) {
                              signupcontroller.instance.userlogin(
                                  controller.email.text.trim(),
                                  controller.password.text.trim());
                              // Get.to(() => const otp());
                            }
                          },
                          // => movetohome(context),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 15, 82, 182),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          child: Text(
                            "Login",
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
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ?",
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
                                  builder: ((context) => registeroptions())));
                        },
                        child: Text("  Sign up",
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
