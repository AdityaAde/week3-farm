import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:farm/model/user_model.dart';

import 'Login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var email, fullName, username, password;
  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 38),
                      Center(
                        child: Container(
                          height: 150,
                          child: Image.asset('asset/images/farm.jpg'),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty
                              ? "Please enter a valid User Name!! "
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
                      SizedBox(height: 15),
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty
                              ? "Please enter a valid full name !! "
                              : null;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: "Full Name",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.person,
                              ),
                            )),
                        onChanged: (value) {
                          fullName = value;
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        validator: (value) {
                          return value.isEmpty || !value.contains('@')
                              ? "Please enter a valid email !! "
                              : null;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.alternate_email,
                              ),
                            )),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      SizedBox(height: 15),
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
                      SizedBox(height: 15),
                      MaterialButton(
                          splashColor: HexColor('#00adb5'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: Colors.blue,
                          textColor: Colors.black,
                          height: 50,
                          minWidth: 180,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              User()
                                  .submitDataRegister(
                                      fullName, email, username, password)
                                  .then((value) => ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(value),
                                      )));
                              _formKey.currentState.reset();
                            }
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                                _formKey.currentState.reset();
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    decoration: TextDecoration.underline),
                              )),
                        ],
                      ),
                    ]),
              )),
        ));
  }
}
