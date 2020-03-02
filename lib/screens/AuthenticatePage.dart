import 'package:flutter/material.dart';
import 'package:app_mobile/Widget/TextInput.dart';
import 'package:app_mobile/screens/RegisterPage.dart';

class AuthenticatePage extends StatefulWidget {
  AuthenticatePage({
    this.authenticate,
  });
  final Function authenticate;
  @override
  AuthenticatePageState createState() => AuthenticatePageState(
    authenticate: authenticate,
  );
}

class AuthenticatePageState extends State<AuthenticatePage> {
  AuthenticatePageState({
    this.authenticate,
  });
  final _formKey = GlobalKey<FormState>();
  static String _userEmail;
  static String _userPassword;
  Function authenticate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authenticate Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterPage(authenticate: authenticate)),
            ),
          ),
        ]
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextInput(
                onChanged: (text) => setState(() {_userEmail = text;}),
                formValidator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                label: 'Email',
              ),
              TextInput(
                onChanged: (text) => setState(() {_userPassword = text;}),
                formValidator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                label: 'Mot de passe',
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            authenticate(_userEmail, _userPassword);
          }
        },
        // tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}