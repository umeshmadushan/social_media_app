import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_app/exception/auth_exceptions.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign In Anonymously
  Future<void> signInAnonymously() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      final user = userCredential.user;
      if (user != null) {
        print('Signed in anonymously: ${user.uid}');
      }
    } on FirebaseAuthException catch (e) {
      print(
          'Error signing in anonymously: ${mapFirebaseAuthExceptionCode(e.code)}');
      throw Exception(mapFirebaseAuthExceptionCode(e.code));
    } catch (e) {
      print('Error signing in anonymously: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print("signOut");
    } on FirebaseAuthException catch (error) {
      print("Error signOut: ${mapFirebaseAuthExceptionCode(error.code)}");
      throw Exception(mapFirebaseAuthExceptionCode(error.code));
    } catch (error) {
      print("error signout anonymously : $error");
    }
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // create user with emal and password
  Future<void> registerNewUser(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      print("Error signOut: ${mapFirebaseAuthExceptionCode(error.code)}");
      throw Exception(mapFirebaseAuthExceptionCode(error.code));
    } catch (error) {
      print("Error creating user : $error");
    }
  }

  //login method
  Future<void> signInUser(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      print("Error signin user: ${mapFirebaseAuthExceptionCode(error.code)}");
      throw Exception(mapFirebaseAuthExceptionCode(error.code));
    } catch (e) {
      print("error sign in");
    }
  }

  //google sign in
  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser == null) {
        return;
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      //finally, sign in
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (error) {
      print("Error signin user: ${mapFirebaseAuthExceptionCode(error.code)}");
      throw Exception(mapFirebaseAuthExceptionCode(error.code));
    } catch (e) {
      print("error sign in with google : $e");
    }
  }

  //Send password reset email
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      print("Password reset email sent to $email");
    }
    on FirebaseAuthException catch(error){
      print("Error password reset email: ${mapFirebaseAuthExceptionCode(error.code)}");
      throw Exception(mapFirebaseAuthExceptionCode(error.code));
    }
    catch (error) {
      print("Error sending password reset email: $error");
    }
  }
}
