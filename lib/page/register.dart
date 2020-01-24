import 'package:flutter/material.dart';
import 'package:flutter_ebox/page/mainbody.dart';
import 'package:flutter_ebox/services/services.dart';
import 'package:flutter_ebox/util/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameeditcontroller;
  TextEditingController emaileditcontroller;
  TextEditingController passwordeditcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameeditcontroller = TextEditingController();
    emaileditcontroller = TextEditingController();
    passwordeditcontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                  decoration: InputDecoration(hintText: "Name"),
                  controller: nameeditcontroller,
                  onSubmitted: (name) {
                    nameeditcontroller.text = name;
                  }),
              TextField(
                decoration: InputDecoration(hintText: "E mail"),
                controller: emaileditcontroller,
                onSubmitted: (emil) {
                  emaileditcontroller.text = emil;
                },
              ),
              TextField(
                decoration: InputDecoration(hintText: "Password"),
                controller: passwordeditcontroller,
                onSubmitted: (password) {
                  passwordeditcontroller.text = password;
                },
              ),
              RaisedButton(
                child: Text("Register"),
                onPressed: () {
                  reg();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  reg() async {
    final ressponse = await register(nameeditcontroller.text,
        emaileditcontroller.text, passwordeditcontroller.text);
    if (ressponse.status) {
      ShareData(
          name: ressponse.data.name,
          email: ressponse.data.email,
          profile: ressponse.data.profile,
          point: ressponse.data.points,
          token: ressponse.data.token);
      Navigator.pushReplacementNamed(context, '/MainScreen');
    }
  }
}
