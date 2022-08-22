import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BorderTextField extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final String? suffixIcon;
  final Icon? prefixIcon;
  final double borderRadius;

  BorderTextField(
      {this.hintText,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixIcon,
      this.borderRadius = 8.0});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(this.borderRadius),
        /*boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(169, 176, 185, 0.42),
            spreadRadius: 0,
            blurRadius: 8,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],*/
      ),
      child: TextFormField(
        obscureText: this.obscureText,
        decoration: InputDecoration(
          prefixIcon: this.prefixIcon,
          prefixIconConstraints: BoxConstraints(minWidth: 0.0),
          suffixIcon: Container(
            child: Text(
              this.suffixIcon!,
              style: TextStyle(color: Colors.grey),
            ),
            padding: EdgeInsets.only(top: 12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.8),
          ),
          border: InputBorder.none,
          hintText: this.hintText,
          hintStyle: TextStyle(
            fontSize: 14.0,
            color: Color.fromRGBO(169, 176, 185, 1),
          ),
        ),
      ),
    );
  }
}
