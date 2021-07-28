import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz/modals/user.dart';

Users _userFromFirebaseUser(User user) {
  return user != null ? Users(user.uid) : null;
}

class AuthServices {
  final auth = FirebaseAuth.instance;
  Future signInwithEmailAndPassword(String email, String password) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseuser = result.user;
      return _userFromFirebaseUser(firebaseuser);
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  Future signUpWithEmailAndAPassword(String email, String password) async {
    try {
      final result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User firebaseuser = result.user;
      return _userFromFirebaseUser(firebaseuser);
    } catch (e) {
      print(e.toString());
    }
  }

  signout() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }
}
