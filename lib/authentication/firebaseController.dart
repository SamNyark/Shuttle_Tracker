import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User?> _firebaseUser = Rxn<User>();

  String? get user => _firebaseUser.value!.email;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String username, String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => Get.offAllNamed("/login"))
        // ignore: invalid_return_type_for_catch_error
        .catchError((onError) => Get.snackbar("Unable to create account", onError.message));
  }

  void login(String email, String password) async {
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Get.offAllNamed("/main"))
        .catchError((onError) => Get.snackbar("Login failed", onError.message));
  }

  void signOut() {
    _auth.signOut();
  }
}
