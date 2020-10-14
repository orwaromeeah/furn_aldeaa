import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final IconData icon;

  CustomTextField({this.icon, this.hint, this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        child: TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 3.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              prefixIcon: Icon(icon),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xfff6cd61), width: 3.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              hintText: hint),
        ),
      ),
    );
  }
}
