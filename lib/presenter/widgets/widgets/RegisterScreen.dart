import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../../Constants.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'Register_Screen';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Color(0xff3949ab),
      child: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: Column(
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
                    showSpinner = true;
                  });
                  try {
                    final userAuth = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (userAuth != null) {
                      Navigator.pushNamed(context, 'main_screen');
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } on Exception catch (e) {
                    print(e);
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
