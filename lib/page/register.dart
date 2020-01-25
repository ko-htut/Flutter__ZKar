import 'package:flutter/material.dart';
import 'package:flutter_ebox/page/login.dart';
import 'package:flutter_ebox/providers/movie_provider.dart';
import 'package:flutter_ebox/providers/post_provier.dart';
import 'package:flutter_ebox/providers/series_provider.dart';
import 'package:flutter_ebox/providers/user_provider.dart';
import 'package:flutter_ebox/services/services.dart';
import 'package:flutter_ebox/util/share.dart';
import 'package:provider/provider.dart';
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
      body: Stack(
        children: <Widget>[
          Container(
            height: 280,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/ebox_banner_logo.jpg'),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 260),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(23),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Container(
                      color: Color(0xfff5f5f5),
                      child: TextField(
                        controller: nameeditcontroller,
                        onSubmitted: (email) {
                          emaileditcontroller.text = email;
                        },
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'User Name',
                            prefixIcon: Icon(Icons.person_outline),
                            labelStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Container(
                      color: Color(0xfff5f5f5),
                      child: TextField(
                        controller: emaileditcontroller,
                        onSubmitted: (email) {
                          emaileditcontroller.text = email;
                        },
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.person_outline),
                            labelStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0xfff5f5f5),
                    child: TextField(
                      controller: passwordeditcontroller,
                      onSubmitted: (password) {
                        passwordeditcontroller.text = password;
                      },
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          labelStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: MaterialButton(
                      onPressed: () {
                        reg();
                      }, //since this is only a UI app
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xffff2d55),
                      elevation: 0,
                      minWidth: 400,
                      height: 50,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage()));
                        },
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Do you have an account?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                )),
                            TextSpan(
                                text: "Login",
                                style: TextStyle(
                                  color: Color(0xffff2d55),
                                  fontSize: 15,
                                ))
                          ]),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
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
