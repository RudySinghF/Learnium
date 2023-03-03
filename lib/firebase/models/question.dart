import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/firebase/models/quizmodel.dart';

class questionmodel {
  final String? id;
  final String question;
  final String op1;
  final String op2;
  final String op3;
  final String op4;
  final String correctanswer;

  questionmodel({
    this.id,
    required this.question,
    required this.op1,
    required this.op2,
    required this.op3,
    required this.op4,
    required this.correctanswer,
  }) : super();

  tojson() {
    return {
      "Id": id,
      "Question": question,
      "Option 1": op1,
      "Option 2": op2,
      "Option 3": op3,
      "Option 4": op4,
      "Correct answer": correctanswer,
    };
  }

  factory questionmodel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;
    return questionmodel(
      id: documentSnapshot.id,
      question: data["Question"],
      op1: data["Option 1"],
      op2: data["Option 2"],
      op3: data["Option 3"],
      op4: data["Option 4"],
      correctanswer: data["Correct answer"],
    );
  }
}
