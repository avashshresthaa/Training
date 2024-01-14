import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String userName;
  final String password;

  HomePage(this.userName, this.password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            userName,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
