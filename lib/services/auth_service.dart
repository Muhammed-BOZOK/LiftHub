import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solution_challenge/view/app_bottom_navigation_bar.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection('users');
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp(
      {required String name,
      required String surname,
      required String email,
      required String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        _registerUser(
            name: name, surname: surname, email: email, password: password);
      }
    } catch (e) {
      debugPrint('FirebaseAuth ERROR: ${e.toString}');
    }
  }

  Future<void> lognIn(BuildContext context, {required String email, required String password}) async {
    final navigator = Navigator.of(context);
    try {
      final UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        Fluttertoast.showToast(
          msg: 'Entry Successful',
          toastLength: Toast.LENGTH_LONG,
        );
        navigator.push(MaterialPageRoute(builder: (context) => const AppBottomNavigation(),));
      }
    } catch (e) {
      debugPrint('FirebaseAuth ERROR: ${e.toString}');
    }
  }

  Future<void> _registerUser(
      {required String name,
      required String surname,
      required String email,
      required String password}) async {
    await userCollection.doc().set({
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
    });
  }
}
