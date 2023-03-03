import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  final String? id;
  final String name;
  final String email;
  final String password;
  const Usermodel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  tojson() {
    return {
      "ID": id,
      "Name": name,
      "Email": email,
      "password": password,
    };
  }

  factory Usermodel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentsnapshot) {
    final data = documentsnapshot.data()!;
    return Usermodel(
        id: documentsnapshot.id,
        name: data["Name"],
        email: data["Email"],
        password: data["password"]);
  }
}
