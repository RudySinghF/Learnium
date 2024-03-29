import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/clientmodels/itembuilder.dart';
import 'package:quiz_app/firebase/controllers/quizcontroller.dart';
import 'package:quiz_app/firebase/models/quizmodel.dart';
import 'package:quiz_app/pages/startquiz.dart';
import 'package:quiz_app/widgets/alertdialogs/start_quiz_alert.dart';

import '../firebase/controllers/profilecontroller.dart';
import '../firebase/models/user_model.dart';

class upquiz extends StatefulWidget {
  final String name;
  const upquiz(this.name);

  @override
  State<upquiz> createState() => _upquizState();
}

class _upquizState extends State<upquiz> {
  late String quizid;
  late String username;
  late String time;
  final showquiz = Get.put(quizcontroller());
  final user = Get.put(ProfileController());

  void initState() {
    username = widget.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: showquiz.getQuizdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                // modelquiz quizdetails = snapshot.data as modelquiz;
                return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => StartQuizAlert(quizid, username),
                              barrierDismissible: true);
                          quizid = snapshot.requireData[index].id!;
                        },
                        child: Container(
                          // height: 200,
                          width: MediaQuery.of(context).size.width * 0.6,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            snapshot.data![index].quizUrl),
                                        fit: BoxFit.cover)),
                                padding: EdgeInsets.all(1),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 38,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 5),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(snapshot.data![index].quizname,
                                                style: TextStyle(
                                                    fontFamily:
                                                        GoogleFonts.rubik()
                                                            .fontFamily,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 17)),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(snapshot.data![index].quizDesc,
                                                style: TextStyle(
                                                    fontFamily:
                                                        GoogleFonts.rubik()
                                                            .fontFamily,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                    fontSize: 10))
                                          ]),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade600,
                                                spreadRadius: 0.1,
                                                blurRadius: 1)
                                          ]),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Start",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: GoogleFonts.rubik()
                                                    .fontFamily,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 21, 104, 229),
                                                fontSize: 12,
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }));
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
        ));
  }
}
