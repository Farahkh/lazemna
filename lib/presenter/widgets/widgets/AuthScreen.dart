import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  static const String id = 'Auth_screen';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff3949ab),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(tag: 'logo', child: Image.asset('assets/Lazemna_logo.png')),
          Center(
            child: FlatButton(
              onPressed: () => Navigator.pushNamed(context, 'login_screen'),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Center(
            child: FlatButton(
              onPressed: () => Navigator.pushNamed(context, 'register_screen'),
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
