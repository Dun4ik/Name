import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Light(title: 'Flutter Demo Home Page'),
    );
  }
}

class Light extends StatefulWidget {
  Light({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LightState createState() => _LightState();
}

class _LightState extends State<Light> {
  double het = 17.3;
  String kej = "Joker";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[

        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Text(kej, style: TextStyle(fontFamily: "DancingScript", color: Color.fromRGBO(22, 1, 5, 1)),),
        ),
        const Image(
          image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
        ),
        FlatButton(
          child: Text("Button"),
          onPressed: () {},
        )
      ],
    ));
  }
}
