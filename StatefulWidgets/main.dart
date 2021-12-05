import 'package:flutter/material.dart';

void main() => runApp(HelloFlutterApp());

class HelloFlutterApp extends StatefulWidget {
  @override
  _HelloFlutterAppState createState() => _HelloFlutterAppState();
}

String welcomeMessage = "Hoşgeldiniz, kayıt olun !";
String registerMessage = "Hoşgeldin Kerem!";

class _HelloFlutterAppState extends State<HelloFlutterApp> {

  String displayText = welcomeMessage;

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Hello Flutter App"),
            leading: Icon(Icons.home),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_right_alt),
                onPressed: () {
                  setState(() {
                    displayText = displayText == welcomeMessage
                    ? registerMessage
                    : welcomeMessage;
                  });
                },
              )
            ],
          ),
          body: Center(
            child: Text(
              displayText,
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      );
  }
}