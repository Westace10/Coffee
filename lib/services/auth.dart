// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:coffee_new/models/user.dart';
import 'package:coffee_new/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  CustomUser? _userFromFirebaseUser(User? user) {
    return user != null ? CustomUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<CustomUser?> get user {
    return _auth
        .authStateChanges()
        // .map((User? user) => _userFromFirebaseUser(user!));
        .map(_userFromFirebaseUser);
  }

  // sign in anonymous
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return e;
    }
  }

  // sign in email & password
  Future signIn({
    String? email,
    String? password,
  }) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email.toString().toLowerCase(),
        password: password.toString().toLowerCase(),
      );
      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return e;
    }
  }
  // [firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.

  // register email & password
  Future registerWithEmailandPswd({
    String? firstname,
    String? lastName,
    String? profession,
    String? email,
    String? password,
    String? phoneNumber,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email.toString(),
        password: password.toString(),
      );
      User user = result.user!;

      // create a data document for users

      await DatabaseService(uid: user.uid).updateUserData(
        firstName: firstname,
        lastName: lastName,
        userId: email,
        dateCreated: DateTime.now().toString(),
        profession: profession,
        phoneNumb: phoneNumber,
      );

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return e;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return e;
    }
  }

  // forgot password
}
