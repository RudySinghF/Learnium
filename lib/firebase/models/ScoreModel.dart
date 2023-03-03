import 'package:cloud_firestore/cloud_firestore.dart';

class Results {
  final String? id;
  final String studentname;
  final String exam;
  final String marks;
  final String quizlength;
  const Results(
      {this.id,
      required this.studentname,
      required this.exam,
      required this.marks,
      required this.quizlength});

  tojson() {
    return {
      // "Id": id,
      "Student Name": studentname,
      "Exam": exam,
      "Marks": marks,
      "Total Questions": quizlength
    };
  }

  factory Results.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;
    return Results(
      id: documentSnapshot.id,
      studentname: data["Student Name"],
      exam: data["Exam"],
      marks: data["Marks"],
      quizlength: data["Total Questions"],
    );
  }
}
