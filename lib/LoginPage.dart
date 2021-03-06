import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            SizedBox(
              height: 80.0,
            ),
            Column(
              children: [
                Icon(Icons.import_contacts),
                // Image.asset('assets/images/diamond.png'),
                SizedBox(
                  height: 16.0,
                ),
                Text("SHRINE")
              ],
            ),
            SizedBox(
              height: 120.0,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(filled: true, labelText: 'Username'),
            ),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(filled: true, labelText: 'Password'),
              obscureText: true,
            ),
            ButtonBar(
              children: [
                FlatButton(
                    onPressed: () {
                      _usernameController.clear();
                      _passwordController.clear();
                    },
                    child: Text('CANCEL')),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('NEXT'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
