import 'package:flutter/material.dart';
import 'package:flutterdemo1/Providers/blockProvider.dart';
import 'package:flutterdemo1/Providers/formbloc.dart';
import 'package:flutterdemo1/model/User.dart';

class Extra extends StatefulWidget {
  @override
  _ExtraState createState() => _ExtraState();
}

class _ExtraState extends State<Extra> {
  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: "write here"
              ),
            ),
            TextButton(
              onPressed: (){
                print("hello");
              },
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
