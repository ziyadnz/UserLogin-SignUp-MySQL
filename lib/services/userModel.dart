import 'dart:convert';


UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String name;
  String surname;
  String mail;
  String phone;
  String adress;
  String password;

  UserModel(
      {this.name,
      this.surname,
      this.mail,
      this.phone,
      this.adress,
      this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["user_name"],
        surname: json["user_surname"],
        mail: json["user_mail"],
        phone: json["user_phone"],
        adress: json["user_adress"],
        password: json["user_password"],
      );

  Map<String, dynamic> toJson() => {
        "user_name": name,
        "user_surname": surname,
        "user_mail": mail,
        "user_phone": phone,
        "user_adress": adress,
        "user_password": password

      };


}
