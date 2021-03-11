import 'package:farm/Widget/alert.dart';
import 'package:farm/model/user_model.dart';
import 'package:farm/view/Register.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'MainPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = new GlobalKey<FormState>();
  var username, password;
  User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 70),
            Center(
              child: Container(
                height: 230,
                child: Image.asset('asset/images/farm.jpg'),
              ),
            ),
            SizedBox(height: 25),
            Form(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(
                            validator: (value) {
                              return value.isEmpty
                                  ? "Please enter a valid username !! "
                                  : null;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                labelText: "Username",
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.person,
                                  ),
                                )),
                            onChanged: (value) {
                              username = value;
                            },
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.lock,
                                  ),
                                )),
                            obscureText: true,
                            validator: (value) {
                              return value.length < 6
                                  ? "Your password less than 6 characters !!"
                                  : null;
                            },
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                        ]))),
            SizedBox(height: 40),
            MaterialButton(
                splashColor: HexColor('#00adb5'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.blue,
                textColor: Colors.black,
                height: 50,
                minWidth: 180,
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    user.submitDataLogin(username, password).then((value) =>
                        value.toString() == "signIn"
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PageControl()))
                            : showAlertDialog(
                                context, 'Username atau Password Salah!!!'));
                    _formKey.currentState.reset();
                  }
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                      _formKey.currentState.reset();
                    },
                    child: Text(
                      " Register",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          decoration: TextDecoration.underline),
                    )),
              ],
            ),
          ]),
        ));
  }
}
