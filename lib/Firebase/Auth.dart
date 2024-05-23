import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth _firebaseAuth =
      FirebaseAuth.instance; //Crea l'instanza FirebaseAuth
  User? get currentUser =>
      _firebaseAuth.currentUser; //Associa l'utente che ha effettuato il login
  Stream<User?> get authStateChanges => _firebaseAuth
      .authStateChanges(); //Controlla ogni modifica di stato dell'autentificazione

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> singOut() async {
    await _firebaseAuth.signOut();
  }
}
