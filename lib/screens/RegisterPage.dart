import 'package:flutter/material.dart';
import 'package:app_mobile/services/http/authHttpService.dart' as http;
import 'package:app_mobile/Widget/TextInput.dart';
import 'package:validators/validators.dart';
import 'package:app_mobile/screens/AuthenticatePage.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({
    Key key,
    @required this.authenticate,
    }) : super(key: key);
    final Function authenticate;
  @override
  RegisterPageState createState() => RegisterPageState(
    authenticate: authenticate,
  );
}

class RegisterPageState extends State<RegisterPage> {
  RegisterPageState({this.authenticate});
  final Function authenticate;
  final _formKey = GlobalKey<FormState>();
  static String _userFirstName;
  static String _userLastName;
  static String _userEmail;
  static String _userPassword;

  Function _validateName = (value) {
    if (value.isEmpty) {
      return 'Please enter some text';
    }
    if (!isAlpha(value)) {
      return 'Champs invalide';
    }
    return null;
  };

  Function _validateEmail = (value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    if (!isEmail(value)) {
      return 'Email invalide';
    }
    return null;
  };

  Function _validatePassword = (value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    if (!isAlphanumeric(value)) {
      return 'mot de passe faible';
    }
    return null;
  };

  Function registerUser = (_formKey) {
    if (_formKey.currentState.validate()) {
      http.register(_userFirstName, _userLastName, _userEmail, _userPassword);
    }
    else {
      print('NOT OK');
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AuthenticatePage(authenticate: authenticate)),
            ),
          )
        ]
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView (
            children: <Widget>[
              TextInput(
                label: 'Prénom',
                onChanged: (text) => setState(() {_userFirstName = text;}),
                formValidator: _validateName,
              ),
              TextInput(
                label: 'Nom',
                onChanged: (text) => setState(() {_userLastName = text;}),
                formValidator: _validateName,
              ),
              TextInput(
                label: 'Email',
                onChanged: (text) => setState(() {_userEmail = text;}),
                formValidator: _validateEmail,
              ),
              TextInput(
                label: 'Mot de passe',
                onChanged: (text) => setState(() {_userPassword = text;}),
                formValidator: _validatePassword,
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RaisedButton(
                  onPressed: () => registerUser(_formKey),
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}