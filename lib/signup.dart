import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController callController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RegExp emailVal = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  List gender = ["Male", "Female", "Other"];
  bool isReading = false, isMusic = false, isGame = false;

  late String selectedGender = "";
  late String selectedHobby = "";

  late var prefs;

  @override
  void initState() {
    super.initState();
    initPref();
  }

  Future<void> initPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              log(value);
              selectedGender = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: const FlutterLogo(
                  size: 50,
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: TextField(
                    maxLength: 20,
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixIcon: Icon(Icons.person),
                      labelStyle: TextStyle(
                        color: Colors.blue,
                      ),
                      labelText: 'Fullname',
                      hintText: 'Fullname',
                    ),
                    autofocus: false,
                  )),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: TextField(
                    maxLength: 20,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: TextField(
                    maxLength: 20,
                    controller: callController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixIcon: Icon(Icons.call),
                      labelStyle: TextStyle(
                        color: Colors.blue,
                      ),
                      labelText: 'Phone',
                      hintText: 'Phone',
                    ),
                    autofocus: false,
                  )),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: TextField(
                    maxLength: 20,
                    controller: passwordController,
                    keyboardType: TextInputType.text,
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
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: TextField(
                    maxLength: 20,
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixIcon: Icon(Icons.password),
                      labelStyle: TextStyle(
                        color: Colors.blue,
                      ),
                      labelText: 'Confirm Password',
                      hintText: 'Confirm Password',
                    ),
                    autofocus: false,
                    obscureText: true,
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 15),
                  child: const Text("Gender")),
              Row(
                children: <Widget>[
                  addRadioButton(0, 'Male'),
                  addRadioButton(1, 'Female'),
                  addRadioButton(2, 'Others'),
                ],
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 15),
                  child: const Text("Hobbies")),
              Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Theme.of(context).primaryColor,
                        value: isReading,
                        onChanged: (value) {
                          setState(() {
                            log(value.toString());
                            isReading = value!;
                          });
                        },
                      ),
                      const Text("Reading"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Theme.of(context).primaryColor,
                        value: isGame,
                        onChanged: (value) {
                          setState(() {
                            log(value.toString());
                            isGame = value!;
                          });
                        },
                      ),
                      const Text("Game"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Theme.of(context).primaryColor,
                        value: isMusic,
                        onChanged: (value) {
                          setState(() {
                            log(value.toString());
                            isMusic = value!;
                          });
                        },
                      ),
                      const Text("Music"),
                    ],
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());

                    log(nameController.text);
                    log(passwordController.text);

                    String name = nameController.text;
                    String email = emailController.text;
                    String phone = callController.text;
                    String password = passwordController.text;
                    String confirmPwd = confirmPasswordController.text;

                    if (name.isEmpty) {
                      launchShowDialog("Fullname can't be empty");
                      return;
                    } else if (email.isEmpty) {
                      launchShowDialog("Email can't be empty");
                      return;
                    } else if (!emailVal.hasMatch(email)) {
                      launchShowDialog("Email should be valid");
                      return;
                    } else if (phone.isEmpty) {
                      launchShowDialog("Phone can't be empty");
                      return;
                    } else if (password.isEmpty) {
                      launchShowDialog("Password can't be empty");
                      return;
                    } else if (confirmPwd.isEmpty) {
                      launchShowDialog("Confirm Password can't be empty");
                      return;
                    } else if (password != confirmPwd) {
                      launchShowDialog(
                          "Password and Confirm Password should be same");
                      return;
                    }

                    saveUserData(name, email, phone, password, selectedGender,
                            isReading, isGame, isMusic)
                        .then((value) => Navigator.of(context).pop()
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => const MyHomePage(
                            //               title: "Home",
                            //             )))
                            );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
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

  Future<void> saveUserData(
      String name,
      String email,
      String phone,
      String password,
      String selectedGender,
      bool isReading,
      bool isGame,
      bool isMusic) async {
    await prefs.setString("name", name);
    await prefs.setString("email", email);
    await prefs.setString("phone", phone);
    await prefs.setString("password", password);
    await prefs.setString("gender", selectedGender);
    await prefs.setBool("isReading", isReading);
    await prefs.setBool("isGame", isGame);
    await prefs.setBool("isMusic", isMusic);
  }
}
