import 'package:flutter/material.dart';
import 'file:///C:/Users/HP/Desktop/flutter_projects_neosoft/flutterdemo1/lib/Providers/ProviderClass.dart';
import 'package:flutterdemo1/UI/RegistratonPage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DemoApp(),
    );
  }
}

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_)=> ProviderClass(),
        child: MaterialApp(
          home: RegistrationPage(),
        )
    );
  }
}
