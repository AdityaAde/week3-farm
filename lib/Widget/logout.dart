import 'package:farm/view/Login.dart';
import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return Logout();
  }
}

class Logout extends StatelessWidget {
  const Logout({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return Center(
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Text(
          "Log Out",
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.blue,
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
      ),
    );
  }
}
