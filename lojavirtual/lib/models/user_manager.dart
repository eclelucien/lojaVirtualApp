// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:lojavirtual/helpers/firebase_errors.dart';
import 'package:lojavirtual/models/users.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    print('Vamos ver');
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Users user;

  bool _loading = false;
  bool get loading => _loading;
  bool get IsLoggedIn => user != null;

  //Uma função para o sigin do cliente
  Future<void> signIn({Users user, Function onFail, Function onSuccess}) async {
    loading = true;

    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      // this.user = result.user;
      user.id = result.user.uid;
      await _loadCurrentUser(firebaseuser: result.user);

      loading = false;
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
      print(e.code);
    }
    loading = false;
  }

  //Uma função para o sigin do cliente
  Future<void> signUp({Users user, Function onFail, Function onSuccess}) async {
    loading = true;
    try {
      final UserCredential result = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      this.user = user;
      user.id = result.user.uid;

      await user.saveData();

      loading = false;
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

  void signOut() {
    auth.signOut();
    user = null;
    notifyListeners();
  }

  Future<void> _loadCurrentUser({User firebaseuser}) async {
    final User currentUser = firebaseuser ?? await auth.currentUser;

    if (currentUser != null) {
      final DocumentSnapshot docUser =
          await firestore.collection('users').doc(currentUser.uid).get();
      user = Users.fromDocument(docUser);
      print(user.name);
      notifyListeners();
    }
  }
}
