import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/login_model.dart';
import 'package:flutter_application_3/network/dataprovider.dart';
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

  void showLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 8,
              ),
              Text("Loading"),
            ],
          ),
        );
      },
    );
  }

//To show any message
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

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
              usernameController: usernameController,
              hintText: "Username",
              icon: Icons.person,
            ),
            CustomTextField(
              usernameController: passwordController,
              hintText: "Password",
              icon: Icons.lock_clock,
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                //Loading Widget
                showLoginDialog(context);
                DataProvider dataProvider = DataProvider();

                try {
                  LoginModel getResult = await dataProvider.getLogin(
                    username: usernameController.text,
                    password: passwordController.text,
                  );
                  if (getResult.result!.verified == true) {
                    //To remove loading widget.
                    Navigator.pop(context);

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return BottomNavigationPage();
                      },
                    ));
                  } else {
                    Navigator.pop(context);
                    print("Wrong Pass");
                    showSnackBar(context, 'Wrong password. Please try again.');
                  }
                } catch (e) {
                  //Navigator pop used to remove the loading dialog box and snack used to dislpay message.
                  Navigator.pop(context);
                  print("Wrong Pass");
                  showSnackBar(context, 'Wrong password. Please try again.');
                }
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
