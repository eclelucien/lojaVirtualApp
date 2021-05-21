import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String id;
  String name;
  String email;
  String password;
  String confirmpassword;

  Users.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document.get(name);
    email = document.get(email);
  }

  Users({this.email, this.password, this.name, this.confirmpassword, this.id});

  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('users/$id');

  Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
