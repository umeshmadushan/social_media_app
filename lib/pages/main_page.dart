import 'package:flutter/material.dart';
import 'package:social_app/pages/auth/home_page.dart';
import 'package:social_app/services/auth_service.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final String userId = AuthService().getCurrentUser()?.email ?? "Unknown";

  void _signOut(BuildContext context) async {
    AuthService().signOut();

    //navigate home
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Main Page"),
            const SizedBox(
              height: 20,
            ),
            const Text("Signed In!"),
            const SizedBox(
              height: 20,
            ),
            Text('UserId : $userId'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  _signOut(context);
                },
                child: const Text("SignOut"))
          ],
        ),
      ),
    );
  }
}
