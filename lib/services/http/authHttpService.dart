import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

String authUrl = 'http://172.31.30.119:3001/auth';
String registerRoute = '/register';
String authenticateRoute = '/authenticate';

Future<Map> register(firstName, lastName, email, password) {
  Map body = {'firstName': firstName, 'lastName': lastName, 'email': email, 'password': password};
  return http.post('$authUrl$registerRoute', body: body)
  .then((res) {
    // Map responseBody = json.decode(res.body);
    print('res.body');
    print(res.body);
    print('res.body');
    // return responseBody;
  })
  .catchError((err) {
    print('<--ERROR--->');
    print(err);
    print('<--ERROR--->');
    return err;
  });
}


Future<Map> authenticate(email, password) {
  print('AUTHENTICATE $authUrl$authenticateRoute');
  Map body = {'email': email, 'password': password};
  return http.post('$authUrl$authenticateRoute', body: body)
  .then((res) {
    Map responseBody = json.decode(res.body);
    return responseBody;
  })
  .catchError((err) {
    print('<--ERROR--->');
    print(err);
    print('<--ERROR--->');
    return err;
  });
}