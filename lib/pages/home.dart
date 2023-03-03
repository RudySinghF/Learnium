import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/firebase/Authentication/authentication.dart';
import 'package:quiz_app/firebase/controllers/profilecontroller.dart';
import 'package:quiz_app/firebase/models/user_model.dart';
import 'package:quiz_app/widgets/content.dart';
import 'package:quiz_app/widgets/miscquiz.dart';
import 'package:quiz_app/widgets/searchbar.dart';
import 'package:quiz_app/widgets/upcomingquiz.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

final profilecontroller = Get.put(ProfileController());

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: FutureBuilder(
          future: profilecontroller.getUserdata(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                Usermodel userdetails = snapshot.data as Usermodel;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/coffee-g0bcbcb7bd_1920.jpg"),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                  border: Border.all()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 0.1),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    userdetails.name,
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.rubik().fontFamily,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Student",
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.rubik().fontFamily,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 11),
                                  )
                                ]),
                          ),
                          Expanded(child: SizedBox()),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                authentication.instance.logout();
                              },
                              child: Icon(
                                Icons.logout,
                                size: 32,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Text(
                            "Your recent activity",
                            style: TextStyle(
                                fontFamily: GoogleFonts.rubik().fontFamily,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    contentwidget(),
                    SizedBox(
                      height: 20,
                    ),
                    searchbar(),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Text(
                            "Upcoming tests",
                            style: TextStyle(
                                fontFamily: GoogleFonts.rubik().fontFamily,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    upquiz(userdetails.name),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Text(
                            "More for you",
                            style: TextStyle(
                                fontFamily: GoogleFonts.rubik().fontFamily,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    quizmisc(),
                  ],
                );
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
        ),
      )),
    );
  }
}
