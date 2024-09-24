import 'package:flutter/material.dart';
import 'package:social_app/pages/main_page.dart';
import 'package:social_app/services/auth_service.dart';

class AnonymousPage extends StatelessWidget {
  const AnonymousPage({super.key});

  void _signInAnonymously(BuildContext context) async {
    try {
      await AuthService().signInAnonymously();
      //navigate to main page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      );
    } catch (error) {
      print("Error sign In Anonymously : $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Anonymous Login"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _signInAnonymously(context),
          child: Text("Sign In Anonymously"),
        ),
      ),
    );
  }
}
