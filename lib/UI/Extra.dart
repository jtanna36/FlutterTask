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
  FormBloc formBloc = new FormBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Container(
        child: Column(
          children: [
            StreamBuilder<User>(
                stream: formBloc.userStream,
                builder: (context, snapshot) {
                  controller.text = snapshot.data.value.toString();
                  return TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Hello here"
                    ),
                  );
                }),
            TextButton(
              onPressed: (){
                formBloc.selectCity(User(3));
              },
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
