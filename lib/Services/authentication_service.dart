import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthenticationService {
  final FirebaseAuth _auth;
  AuthenticationService(this._auth);

  Stream<User> get authStateChanges => _auth.authStateChanges();

  Future<void> signedOut() async {
    await _auth.signOut();
  }

  Future<void> signedIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Signed In';
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<void> signUp(
      String email, String password, String name, String phoneNumber) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      var user = _auth.currentUser;
      if (user != null) {
        await user.updateProfile(displayName: name);
        //DB YE KAYITI ÇAĞIRIYOR.
      }
      return 'Signed Up';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
