import 'package:login/hw/login.dart';
import 'package:login/services/userModel.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  final List<UserModel> users;

  UserList({Key key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
     
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Card(child: Container(
        color: Colors.black,
        height: 200.0,
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.green,
                    height: 50.0,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("User Name: "+users[index].name+"  "+ "User Surname: " +users[index].surname),
                        Text("User Mail: "+users[index].mail+" "+ "User Phone: "+users[index].phone),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                      height: 100.0,
                      width: double.infinity,
                      child: Text("User Adress:\n"+users[index].adress),
                      ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.red,
              height: double.infinity,
              width: 150.0,
              child: Image.network("https://thumbs.dreamstime.com/b/funny-face-baby-27701492.jpg",
                fit: BoxFit.fill

              ),
            ),
          ],
        ),
        ),
      );
        
        //Text(users[index].name.toString(),),);
      },
    );
  }
}