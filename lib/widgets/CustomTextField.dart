import 'package:flutter/material.dart';
class CustomeTextField extends StatefulWidget {
  var hint;
  var icon;
  bool isObscure;
  bool isIconNeeded;
  TextInputType inputType;
  TextEditingController controller;

  CustomeTextField({this.hint,this.icon,this.isObscure=false,this.isIconNeeded=false,this.controller,this.inputType});
  @override
  _CustomeTextFieldState createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  @override
  Widget build(BuildContext context) {
    if(widget.inputType == TextInputType.number)
    {
      return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Row(
            children: [
              if(widget.isIconNeeded == true)
                Icon(
                  widget.icon,
                  color: Color(0xFF0A5189),
                ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                  child: TextFormField(
                    keyboardType: widget.inputType,
                    controller: widget.controller,
                    obscureText: widget.isObscure,
                    decoration: InputDecoration(
                      hintText: widget.hint,
                      border: InputBorder.none,
                    ),
                  ))
            ],
          ),
        ),
      );
    }
    else
    {
      return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Row(
            children: [
              if(widget.isIconNeeded == true)
                Icon(
                  widget.icon,
                  color: Color(0xFF0A5189),
                ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                  child: TextFormField(
                    controller: widget.controller,
                    obscureText: widget.isObscure,
                    decoration: InputDecoration(
                      hintText: widget.hint,
                      border: InputBorder.none,
                    ),
                  ))
            ],
          ),
        ),
      );
    }
  }
}