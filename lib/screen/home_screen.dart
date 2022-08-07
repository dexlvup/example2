import 'package:example2/screen/about_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return AboutScreen();
                },
              ),
            )
          },
          child: Text("Go to about screen"),
        ),
      ),
    );
  }
}
