import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:lojavirtual/models/users.dart';

class UserManager {
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn(Users user) async {
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      print(result.user.uid);
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
