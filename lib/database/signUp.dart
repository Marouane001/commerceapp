import 'package:commerceapp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../home.dart';


class Signup extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<Signup> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _name = new TextEditingController();


  Future<void> Signup() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: _email.text, password: _password.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Sign Up using Firebase'),
        centerTitle: true,
      ),
      body: new ListView(

      children: <Widget>[
        new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text('Subscribe'),
        new TextField(
          decoration: new InputDecoration(
              labelText: 'enter your name',
              hintText: 'enter your name ',
              prefixIcon: new Icon(Icons.people),
              suffixIcon: new Icon(Icons.verified_user)),
          keyboardType: TextInputType.text,
          controller: _name),
            new TextField(
              decoration: new InputDecoration(
                  labelText: 'email',
                  hintText: 'exemple@gmail.com',
                  icon: new Icon(Icons.people)),
              keyboardType: TextInputType.text,
              controller: _email,
            ),

            SizedBox(
              height: 10,
            ),
            new TextField(
              decoration: new InputDecoration(
                  labelText: 'password',
                  hintText: 'password',
                  icon: new Icon(Icons.people)),
              keyboardType: TextInputType.text,
              controller: _password,
            ),
            new TextField(
              decoration: new InputDecoration(
                  labelText: 'confirm your password ',
                  hintText: 'confirm your password ',
                  prefixIcon: new Icon(Icons.people),
                  suffixIcon: new Icon(Icons.verified_user)),
              keyboardType: TextInputType.text,
              controller: _password,
            ),
            SizedBox(
              height: 20,
            ),
            new ElevatedButton(onPressed: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()))
            },
                child: Text("Done"))
          ],
        ),
      ),
    ]));
  }
}
