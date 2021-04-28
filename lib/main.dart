import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/hw/StartPage.dart';
import './hw/WelcomePage.dart';
import 'package:login/services/userModel.dart';
import 'package:flutter_login/theme.dart';

void main() => runApp(new MyApp());

String username = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DATABASE',
      home: 
      //DataTableDemo(),
      // new MyHomePage(),
      WelcomePage(),
      // StartPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Future<UserModel> createUser(String name, String surname, String mail,
    String phone, String adress, String password) async {
  var url = Uri.parse('http://localhost/assigment3/setUser.php/');

  final response = await http.post(url, body: {
    "user_name": name,
    "user_surname": surname,
    "user_mail": mail,
    "user_phone": phone,
    "user_adress": adress,
    "user_password": password,
  });

  if (response.statusCode == 201) {
    print('okeey');
    final String responseString = response.body;

    return userModelFromJson(responseString);
  } else {
    print('NOOOOOOO');
    return null;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController surnamecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  TextEditingController adresscontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  var url = Uri.parse("http://localhost/assigment3/setUser.php/");
  // ignore: missing_return
  // Future<http.Response> senddata() async {
  //   var response = await http.post(url, body: {
  //     'user_name': namecontroller.text,
  //     'user_surname': surnamecontroller.text,
  //     'user_mail': emailcontroller.text,
  //     'user_phone': phonecontroller.text,
  //     'user_adress': adresscontroller.text,
  //     'user_password': passwordcontroller.text,
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Username",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: namecontroller,
                decoration: InputDecoration(hintText: 'name'),
              ),
              Text(
                "User Surname",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: surnamecontroller,
                decoration: InputDecoration(hintText: 'Surname'),
              ),
              Text(
                "Email",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: emailcontroller,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              Text(
                "Phone",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: phonecontroller,
                decoration: InputDecoration(hintText: 'Phone'),
              ),
              Text(
                "Adress",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: adresscontroller,
                decoration: InputDecoration(hintText: 'Adress'),
              ),
              Text(
                "Password",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(hintText: 'Passwords'),
              ),
              ElevatedButton(
                  child: Text("Register"),
                  onPressed: () async {
                    final String name = namecontroller.text;
                    final String surname = surnamecontroller.text;
                    final String email = emailcontroller.text;
                    final String phone = phonecontroller.text;
                    final String adress = adresscontroller.text;
                    final String password = passwordcontroller.text;
                    final UserModel user = await createUser(
                        name, surname, email, phone, adress, password);
                    // senddata();
                    setState(() {
                      // _user = user;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
