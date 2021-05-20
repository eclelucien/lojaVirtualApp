// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:lojavirtual/helpers/firebase_errors.dart';
import 'package:lojavirtual/models/users.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  User user;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> signIn({Users user, Function onFail, Function onSuccess}) async {
    loading = true;
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      this.user = result.user;

      onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser() async {
    final User currentUser = auth.currentUser;

    if (currentUser != null) {
      user = currentUser;
      print(user.uid);
    }

    notifyListeners();
  }
}
