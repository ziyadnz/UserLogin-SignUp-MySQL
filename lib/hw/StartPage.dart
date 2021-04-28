import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/services/UserList.dart';
import 'dart:convert';

import '../services/userModel.dart';

class StartPage extends StatefulWidget {
   String role='';
   String mail='';
  StartPage({this.role, this.mail});
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  var url = Uri.parse('http://192.168.1.101/assigment3/getAuser.php/');

  Future<List<UserModel>> getUsers() async {
    print(widget.role);
    print("myrolllllllllee");
    try {
      var map = Map<String, dynamic>();
      final response = await http.post(url, body: {
        "user_mail": widget.mail.toString(),
        "user_role": widget.role.toString(),
      });
      print('getEmployees Response: ${response.body}');
      print(response.statusCode);
      if (200 == response.statusCode) {
        // List<UserModel> list = parseResponse(response.body);

        return compute(parseUsers, response.body);
      } else {
        return List<UserModel>();
      }
    } catch (e) {
      return List<UserModel>(); // return an empty list on exception/error
    }
  }

  List<UserModel> parseUsers(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // //  getUsers();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<UserModel>>(
        future: getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          print(snapshot.data);
          return snapshot.hasData
              ? UserList(users: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );

    // ListView.builder(
    //   itemCount: users.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(title: Text(users[index].name));
    //   },
    // ),
  }
}
