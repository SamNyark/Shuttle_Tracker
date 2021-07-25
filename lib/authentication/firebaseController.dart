import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FirebaseController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User> _firebaseUser = Rxn<User>();

  String? get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String username, String email, String password) async {
    Get.dialog(CircularProgressIndicator());
    await _auth
        .createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim())
        .then((value) {
      Get.defaultDialog(content: Text("loading"));
      Get.offAllNamed("/login");
    })
        // ignore: invalid_return_type_for_catch_error
        .catchError((onError) => Get.snackbar("Failed", onError.message,
            backgroundColor: Colors.red.shade400, colorText: Colors.white));
  }

  void login(String email, String password) async {
    Get.defaultDialog(content: CircularProgressIndicator(), title: "");
    _auth
        .signInWithEmailAndPassword(
            email: email.trim(), password: password.trim())
        .then((value) => Get.offAllNamed("/main"))
        // ignore: invalid_return_type_for_catch_error
        .catchError((onError) => Get.snackbar("Login failed", onError.message,
            backgroundColor: Colors.red.shade400, colorText: Colors.white));
  }

  void signOut() {
    _auth.signOut().then((value) => Get.offAllNamed("/welcome"));
  }
}
