import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class AuthenticationService {
  final FirebaseAuth _auth;
  AuthenticationService(this._auth);

  Stream<User> get authStateChanges => _auth.authStateChanges();

  Future<void> signedOut() async {
    await _auth.signOut();
  }

  Future<String> signedIn(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      //Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
      Navigator.of(context).pushNamed("/home");
      return 'Signed In';
    } on FirebaseException catch (e) {
      print(e.message);
      //Yanlış şifre girildiyse.
      if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Yanlış Şifre Girdiniz!",
              textAlign: TextAlign.center,
            ),
          ),
        );
      } //Kullanıcı bulunamadıysa.
      else if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Kullanıcı Bulunamadı.',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
      return e.message;
    } catch (e) {
      return e.message;
    }
  }

  Future<String> signUp(
      String email, String password, String name, BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var user = _auth.currentUser;
      if (user != null) {
        await user.updateProfile(displayName: name);
      }
      Navigator.of(context).pushNamed("/home");
      return 'Signed Up';
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Hesap zaten var',
              textAlign: TextAlign.center,
            ),
          ),
        );
        return 'The account already exists for that email';
      }
    } catch (e) {
      return "BURAYI DÖNDÜK";
    }
  }
}
