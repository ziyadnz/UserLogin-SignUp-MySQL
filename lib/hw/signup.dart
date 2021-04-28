import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/hw/StartPage.dart';
import 'package:login/main.dart';
import 'package:http/http.dart' as http;
import '../services/userModel.dart';
import 'Bcontainer.dart';
import 'login.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
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

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController surnamecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  TextEditingController adresscontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, TextEditingController textcontroller,
      {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          textcontroller==passwordcontroller? TextField(
            keyboardType: TextInputType.number,
              controller: textcontroller,
              obscureText: isPassword,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Only numbers",
                  ))
                : TextField(
              controller: textcontroller,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () async {
        final String name = namecontroller.text;
        final String surname = surnamecontroller.text;
        final String email = emailcontroller.text;
        final String phone = phonecontroller.text;
        final String adress = adresscontroller.text;
        final String password = passwordcontroller.text;
        if (name.isEmpty ||
            surname.isEmpty ||
            email.isEmpty ||
            phone.isEmpty ||
            adress.isEmpty ||
            password.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('All fields must be filled'),
            ),
          );
        } else {
           Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
          final UserModel user =
              await createUser(name, surname, email, phone, adress, password);
         

          print("clicked");
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: Text(
          'Register Now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(15),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          TextButton(
            child: Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'D',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'ata',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'base',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Username", namecontroller),
        _entryField("Surname", surnamecontroller),
        _entryField("Email", emailcontroller),
        _entryField("Phone", phonecontroller),
        _entryField("ADREESS", adresscontroller),
        _entryField("Password", passwordcontroller, isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    SizedBox(height: height * .14),
                    // _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            //  Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
