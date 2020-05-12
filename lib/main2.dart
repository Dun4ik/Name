import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          appBar: new AppBar(
              title: new Text('Just not click on me'),
              backgroundColor: Colors.orange),
          body: new MyBody(),
    ));
  }
}

class MyBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return Stack(children: [
      new Center(
          child: new Column(children: [
            new TextField(
              obscureText: false,
              decoration: InputDecoration(
                  border: InputBorder.none, labelText: 'Enter your message here'),
            ),
            new Text('Hello, my friend'),
            new FlatButton(
                onPressed: () async {
                  const url = 'https://yummyanime.club';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Sorry, but your link is not found';
                  }
                },
                child: new Text('JUST PUSH ME!'),
                color: Colors.red,
                textColor: Colors.white),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Secondscreen()));
              },
              child: Text('Other screen'),
              color: Colors.black54,
              textColor: Colors.lightGreenAccent,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Calculator()));
              },
              child: Text('Calculator'),
              color: Colors.green,
              textColor: Colors.black,
            )
          ])),
      new Padding(
          padding: EdgeInsets.only(left: 50.0, top: 200),
          child: new IconButton(
            icon: Icon(Icons.all_inclusive),
            color: Colors.lightGreen,
            onPressed: () async {
              const url = 'https://www.youtube.com/watch?v=SaKdpMnwZf0';
              if (await canLaunch(url))
                launch(url);
              else
                throw 'Sorry, but your link is not found';
            },
          )),
    ]);
  }
}

class NewsBox extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Text(
      'my text',
      style: TextStyle(color: Colors.cyanAccent),
    );
  }
}

class Secondscreen extends StatefulWidget {
  @override
  _SecondscreenState createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  int a = 0;

  int b = 0;
  String result = "";

  int add(int a, int b) {
    return a + b;
  }

  int minus(int a, int b) {
    return a - b;
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('JailBreak'),
          backgroundColor: Colors.indigo,
        ),
        body: Stack(children: [
          Padding(
              padding: EdgeInsets.only(left: 50.0, top: 200),
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        result = add(a, b).toString();
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.remove),
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        result = minus(a, b).toString();
                      });
                    },
                  ),
                ],
              )),
          Column(children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                a = int.parse(value);
              },
              obscureText: false,
              decoration: InputDecoration(
                  border: InputBorder.none, labelText: 'Enter 1 number here'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                b = int.parse(value);
              },
              obscureText: false,
              decoration: InputDecoration(
                  border: InputBorder.none, labelText: 'Enter 2 number here'),
            ),
            Text(result),
          ])
        ]));
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String value = '';
  String a1 = '';
  String m = '';
  String a2 = '';

  void ans(String b) {
    double result = 0;
    if (m == '+')
      result = double.parse(a1) + double.parse(a2);
    else if (m == '-')
      result = double.parse(a1) - double.parse(a2);
    else if (m == '*')
      result = double.parse(a1) * double.parse(a2);
    else
      result = double.parse(a1) / double.parse(a2);
    if (result.toInt().toDouble() == result)
      a1 = result.toInt().toString();
    else
      a1 = result.toString();
    setState(() {
      value = a1;
    });
  }

  Widget build(BuildContext context) {
    double screen_h = MediaQuery.of(context).size.height / 5;
    double screen_w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          backgroundColor: Colors.indigo,
        ),
        body: Column(children: [
          Container(
              height: screen_h / 2.75, width: screen_w, child: Text(value)),
          Row(
            children: [
              Container(
                  height: screen_h,
                  width: screen_w / 4,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      if (value.contains('+') ||
                          value.contains('-') ||
                          value.contains('*') ||
                          value.contains('/'))
                        a2 += '1';
                      else
                        a1 += '1';
                      setState(() {
                        value += '1';
                      });
                    },
                    child: Text('1'),
                  )),
              Container(
                  height: screen_h,
                  width: screen_w / 4,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      if (value.contains('+') ||
                          value.contains('-') ||
                          value.contains('*') ||
                          value.contains('/'))
                        a2 += '2';
                      else
                        a1 += '2';
                      setState(() {
                        value += '2';
                      });
                    },
                    child: Text('2'),
                  )),
              Container(
                  height: screen_h,
                  width: screen_w / 4,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      if (value.contains('+') ||
                          value.contains('-') ||
                          value.contains('*') ||
                          value.contains('/'))
                        a2 += '3';
                      else
                        a1 += '3';
                      setState(() {
                        value += '3';
                      });
                    },
                    child: Text('3'),
                  )),
              Container(
                  height: screen_h,
                  width: screen_w / 4,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      if (value.contains('+') ||
                          value.contains('-') ||
                          value.contains('*') ||
                          value.contains('/')) ans(value);
                      m = '+';
                      setState(() {
                        if (!value.contains('+')) value += '+';
                      });
                    },
                    child: Text('+'),
                  ))
            ],
          ),
          Row(
            children: [
              Container(
                  height: screen_h,
                  width: screen_w / 4,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      if (value.contains('+') ||
                          value.contains('-') ||
                          value.contains('*') ||
                          value.contains('/'))
                        a2 += '4';
                      else
                        a1 += '4';
                      setState(() {
                        value += '4';
                      });
                    },
                    child: Text('4'),
                  )),
              Container(
                  height: screen_h,
                  width: screen_w / 4,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      if (value.contains('+') ||
                          value.contains('-') ||
                          value.contains('*') ||
                          value.contains('/'))
                        a2 += '5';
                      else
                        a1 += '5';
                      setState(() {
                        value += '5';
                      });
                    },
                    child: Text('5'),
                  )),
              Container(
                  height: screen_h,
                  width: screen_w / 4,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      if (value.contains('+') ||
                          value.contains('-') ||
                          value.contains('*') ||
                          value.contains('/'))
                        a2 += '6';
                      else
                        a1 += '6';
                      setState(() {
                        value += '6';
                      });
                    },
                    child: Text('6'),
                  )),
              Container(
                  height: screen_h,
                  width: screen_w / 4,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      if (value.contains('+') ||
                          value.contains('-') ||
                          value.contains('*') ||
                          value.contains('/')) ans(value);
                      m = '-';
                      setState(() {
                        if (!value.contains('-')) value += '-';
                      });
                    },
                    child: Text('-'),
                  ))
            ],
          ),
          Row(
            children: [
              Container(
                  height: screen_h,
                  width: screen_w / 4,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      if (value.contains('+') ||
                          value.contains('-') ||
                          value.contains('*') ||
                          value.contains('/'))
                        a2 += '7';
                      else
                        a1 += '7';
                      setState(() {
                        value += '7';
                      });
                    },
                    child: Text('7'),
                  )),
              Container(
                  height: screen_h,
                  width: screen_w / 4,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      if (value.contains('+') ||
                          value.contains('-') ||
                          value.contains('*') ||
                          value.contains('/'))
                        a2 += '8';
                      else
                        a1 += '8';
                      setState(() {
                        value += '8';
                      });
                    },
                    child: Text('8'),
                  )),
              Container(
                  height: screen_h,
                  width: screen_w / 4,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      if (value.contains('+') ||
                          value.contains('-') ||
                          value.contains('*') ||
                          value.contains('/'))
                        a2 += '9';
                      else
                        a1 += '9';
                      setState(() {
                        value += '9';
                      });
                    },
                    child: Text('9'),
                  )),
              Container(
                  height: screen_h,
                  width: screen_w / 4,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      if (value.contains('+') ||
                          value.contains('-') ||
                          value.contains('*') ||
                          value.contains('/')) ans(value);
                      m = '*';
                      setState(() {
                        if (!value.contains('*')) value += '*';
                      });
                    },
                    child: Text('*'),
                  ))
            ],
          ),
          Row(
            children: [
              Container(
                  height: screen_h,
                  width: screen_w / 4,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        value = '';
                        a1 = '';
                        a2 = '';
                        m = '';
                      });
                    },
                    child: Text('C'),
                  )),
              Container(
                  height: screen_h,
                  width: screen_w / 4,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      if (value.contains('+') ||
                          value.contains('-') ||
                          value.contains('*') ||
                          value.contains('/'))
                        a2 += '0';
                      else
                        a1 += '0';
                      setState(() {
                        value += '0';
                      });
                    },
                    child: Text('0'),
                  )),
              Container(
                  height: screen_h,
                  width: screen_w / 4,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      ans(value);
                    },
                    child: Text('='),
                  )),
              Container(
                  height: screen_h,
                  width: screen_w / 4,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: () {
                      if (value.contains('+') ||
                          value.contains('-') ||
                          value.contains('*') ||
                          value.contains('/')) ans(value);
                      m = '/';
                      setState(() {
                        if (!value.contains('/')) value += '/';
                      });
                    },
                    child: Text('/'),
                  ))
            ],
          ),
        ]));
  }
}
