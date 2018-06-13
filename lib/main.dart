import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(
    new MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Working with JSON',
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Json App'),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('load_json/person.json'),
            builder: (context, snapshot) {
              //decode Json
              var myData;
              myData = JSON.decode(snapshot.data.toString());
              return new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text("Name: " + myData[index]['name']),
                        new Text("Age: " + myData[index]['age']),
                        new Text("Height: " + myData[index]['height']),
                        new Text("Hair Color: " + myData[index]['hair_Color']),
                        new Text("Gender: " + myData[index]['gender']),
                      ],
                    ),
                  );
                },
                itemCount: myData == null ? 0 : myData.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
