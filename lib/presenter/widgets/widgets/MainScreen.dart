import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'AddItem.dart';
import 'ExpenseItems.dart';

class MainScreen extends StatefulWidget {
  var title;

  MainScreen({Key key, this.title}) : super(key: key);
  static const String id = 'Main_Screen';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    FirebaseUser loggedInUser;

    void getCurrentUser() async {
      try {
        final user = await _auth.currentUser();
        if (user != null) {
          loggedInUser = user;
          print(loggedInUser.email);
        }
      } on Exception catch (e) {
        print(e);
      }
    }

    void _showModalBottomSheet(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (context) => Material(
                clipBehavior: Clip.antiAlias,
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.only(
                        topLeft: new Radius.circular(15.0),
                        topRight: new Radius.circular(15.0))),
                child: AddItem(),
              ));
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.power),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text("expenses"),
              ),
              Tab(
                child: Text("shopping"),
              )
            ],
          ),
          title: Text(widget.title),
        ),
        body: TabBarView(
          children: [
            Center(child: ExpenseItems()),
            Icon(Icons.directions_transit),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showModalBottomSheet(context);
          },
          tooltip: 'add item',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
