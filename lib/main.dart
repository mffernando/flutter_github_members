import 'package:flutter/material.dart';
import 'package:flutter_github_members/widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My App"),
        ),
        body: MyWidget()
      ),
    );
  }
}
