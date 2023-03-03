import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/clientmodels/misc.dart';

class quizmisc extends StatefulWidget {
  const quizmisc({super.key});

  @override
  State<quizmisc> createState() => _quizmiscState();
}

class _quizmiscState extends State<quizmisc> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: miscquiz.miscitems.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {},
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
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16)),
                          image: DecorationImage(
                              image:
                                  AssetImage(miscquiz.miscitems[index].image),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(miscquiz.miscitems[index].name,
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.rubik().fontFamily,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 17)),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(miscquiz.miscitems[index].desc,
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.rubik().fontFamily,
                                          fontWeight: FontWeight.normal,
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade600,
                                      spreadRadius: 0.1,
                                      blurRadius: 1)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Try",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.rubik().fontFamily,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 21, 104, 229),
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
          })),
    );
  }
}
