
import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 10;
  Timer _timer;
  void _start(){
    _counter = 10 ;
    if(_timer!=null){
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(milliseconds: 750), (timer) {
      setState(() {
        if(_counter>0){
          _counter--;
        }else{
          _timer.cancel();
        }
      });
    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (_counter>0)?Text(""):Text("Done!",style: TextStyle(color: Colors.green,fontSize: 30),),
            Text(
              '${_counter}',style: TextStyle(fontSize: 30),
            ),
            RaisedButton(onPressed: (){
              _start();
            },
              color: Colors.green,
              child: Text("Start",style: TextStyle(color: Colors.white,fontSize: 20),),

            ),
          ],
        ),
      ),
    );
  }
}
