import 'package:flutter/material.dart';
import 'package:lazemna/presenter/widgets/widgets/AuthScreen.dart';
import 'package:lazemna/presenter/widgets/widgets/LoginScreen.dart';
import 'package:lazemna/presenter/widgets/widgets/MainScreen.dart';
import 'package:lazemna/presenter/widgets/widgets/RegisterScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lazemna',
        theme: ThemeData(
          primaryColor: Colors.indigo[700],
          accentColor: Colors.lime,
        ),
        initialRoute: 'auth_screen',
        routes: {
          'main_screen': (context) => MainScreen(title: 'Lazemna'),
          'register_screen': (context) => RegisterScreen(),
          'login_screen': (context) => LoginScreen(),
          'auth_screen': (context) => AuthScreen(),
        });
  }
}
