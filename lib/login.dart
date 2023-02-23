import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RegExp emailVal = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  late var prefs;
  String userEmail = "", userPassword = "";
  @override
  void initState() {
    super.initState();
    initPref();
  }

  Future<void> initPref() async {
    prefs = await SharedPreferences.getInstance();
    userEmail = await prefs.getString("email");
    userPassword = await prefs.getString("password");
    log("user email $userEmail");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: const FlutterLogo(
                size: 100,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: TextField(
                  maxLength: 20,
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: Icon(Icons.email),
                    labelStyle: TextStyle(
                      color: Colors.blue,
                    ),
                    labelText: 'Email',
                    hintText: 'Email',
                  ),
                  autofocus: false,
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: TextField(
                  maxLength: 20,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: Icon(Icons.password),
                    labelStyle: TextStyle(
                      color: Colors.blue,
                    ),
                    labelText: 'Password',
                    hintText: 'Password',
                  ),
                  autofocus: false,
                  obscureText: true,
                )),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());

                  log(nameController.text);
                  log(passwordController.text);

                  initPref();

                  String email = nameController.text;
                  String password = passwordController.text;

                  if (email.isEmpty) {
                    launchShowDialog("Email can't be empty");
                    return;
                  } else if (!emailVal.hasMatch(email)) {
                    launchShowDialog("Email should be valid");
                    return;
                  } else if (password.isEmpty) {
                    launchShowDialog("Password can't be empty");
                    return;
                  } else if (userEmail.toString() != email.toString()) {
                    launchShowDialog("Email is not available");
                    return;
                  } else if (userPassword.toString() != password.toString()) {
                    launchShowDialog("Password is wrong");
                    return;
                  }

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const MyHomePage(
                                title: "Home",
                              )));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const Text("New User? Create Account")),
          ],
        ),
      ),
    );
  }

  void launchShowDialog(String msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(msg),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
