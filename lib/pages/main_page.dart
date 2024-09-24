import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: const Center(
        child: Column(
          children: [
            Text("Main Page"),
            SizedBox(height: 20,),
            Text("Signed In!")
          ],
        ),
      ),
    );
  }
}
