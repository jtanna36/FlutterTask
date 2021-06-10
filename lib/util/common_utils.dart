import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo1/Providers/ProviderClass.dart';
import 'package:flutterdemo1/util/Common.dart';
import 'package:provider/provider.dart';
void show(BuildContext context, String statement)
{
  showDialog(
      context: context,
      builder: (BuildContext context) =>
          AlertDialog(
            title: Text("Invalid Input"),
            content:
            Text(statement),
            actions: [closeDialog(context)],
          ));
}

Widget closeDialog(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    child: Text("Ok"),
  );
}


