import 'package:flutter/material.dart';
import 'package:social_app/pages/auth/anonymous.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AnonymousPage(),
    );
  }
}