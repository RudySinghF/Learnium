import 'package:cloud_firestore/cloud_firestore.dart';

class Facultymodel {
  final String? id;
  final String name;
  final String email;
  final String password;
  const Facultymodel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  tojson() {
    return {
      "FacultyName": name,
      "Email": email,
      "password": password,
    };
  }

  factory Facultymodel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> facultySnapshot) {
    final data = facultySnapshot.data()!;
    return Facultymodel(
        id: facultySnapshot.id,
        name: data["FacultyName"],
        email: data["Email"],
        password: data["password"]);
  }
}
