import 'package:flutter/material.dart';
import 'package:app_mobile/screens/HomePage.dart';
import 'package:app_mobile/screens/RegisterPage.dart';
import 'package:app_mobile/screens/AuthenticatePage.dart';

import 'package:app_mobile/services/http/authHttpService.dart' as http;

void main() => runApp(AuthRouter());

class AuthRouter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AuthRouterState();
}

class AuthRouterState extends State<AuthRouter> {
  bool _isAuthenticate = false;





  Future<Map> setAuthStatus(email, psw) async {
    print('Start authentication');
    Map authenticated = await http.authenticate(email, psw);
    print('----------authenticated-----------------');
    print(authenticated);
    print('-----------------authenticated-----------------');
    print(authenticated['token']);
    if (authenticated['token'] != null) {
      print('AUTHENTICATE OK');
      setState(() {
        _isAuthenticate = true;
      });
      // Navigator.pushNamed(context, '/');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
    return authenticated;
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Game',
      debugShowCheckedModeBanner: false,
      routes: {
        '/register': (BuildContext context) => RegisterPage(authenticate: setAuthStatus),
        '/authenticate': (BuildContext context) => AuthenticatePage(authenticate: setAuthStatus),
        '/': (BuildContext context) => _isAuthenticate ? HomePage() : AuthenticatePage(authenticate: setAuthStatus),
      },
    );
  }
}

