import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign In Anonymously
  Future<void> signInAnonymously() async {
    try {
      final UserCredential userCredential = await _auth.signInAnonymously();
      final user = userCredential.user;

      if (user != null) {
        print("Signed in anonymously : ${user.uid}");
      }
    } catch (error) {
      print("error signing in anonymously : $error");
    }
  }
}
