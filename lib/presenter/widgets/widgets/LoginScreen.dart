import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../../Constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'Login_Screen';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool show_spinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Color(0xff3949ab),
      child: ModalProgressHUD(
        inAsyncCall: show_spinner,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(tag: 'logo', child: Image.asset('assets/Lazemna_logo.png')),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kMessageTextFieldDecoration.copyWith(hintText: 'Email'),
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration:
                    kMessageTextFieldDecoration.copyWith(hintText: 'Password'),
              ),
              RaisedButton(
                onPressed: () async {
                  setState(() {
                    show_spinner = true;
                  });
                  try {
                    final userAuth = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (userAuth != null) {
                      Navigator.pushNamed(context, 'main_screen');
                    }
                    show_spinner = false;
                  } on Exception catch (e) {
                    print(e);
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
