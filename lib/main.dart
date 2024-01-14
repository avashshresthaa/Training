import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/bottomnavigationpage.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isCheck = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            SizedBox(
              height: 200,
            ),
            Image.asset(
              "assets/logo.png",
              width: 72,
              height: 180,
            ),
            SizedBox(
              height: 16,
            ),
            Text("Sign up to continue."),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              usernameController: emailController,
              hintText: "Email",
              icon: Icons.email,
            ),

            CustomTextField(
              usernameController: usernameController,
              hintText: "Username",
              icon: Icons.person,
            ),
            CustomTextField(
              usernameController: passwordController,
              hintText: "Password",
              icon: Icons.lock_clock,
            ),
            // TextField(
            //   obscureText: isCheck,
            //   controller: password,
            //   decoration: InputDecoration(
            //     hintText: "Password",
            //     prefixIcon: Icon(Icons.lock),
            //     suffixIcon: GestureDetector(
            //       onTap: () {
            //         setState(() {
            //           isCheck = !isCheck;
            //           print(isCheck);
            //         });
            //       },
            //       child: Icon(Icons.remove_red_eye),
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(18),
            //       borderSide: BorderSide(
            //         color: Colors.green,
            //       ),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(18),
            //       borderSide: BorderSide(
            //         color: Colors.green,
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return BottomNavigationPage();
                  },
                ));
              },
              child: Text(
                "GO TO HOME SCREN",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.usernameController,
      required this.hintText,
      required this.icon});

  final TextEditingController usernameController;
  final String hintText;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: usernameController,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
