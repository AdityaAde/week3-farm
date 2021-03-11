
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


showAlertDialog(BuildContext context,String konteks) {
  // set up the button
  Widget okButton = TextButton(
    child : Text("OK",style: TextStyle(color:HexColor('#463333')),),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    
    backgroundColor:  HexColor('#eeeeee'),
     shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10)),
    elevation: 10,
    title: Text("Alert !!!"),
    content: Text(konteks),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
