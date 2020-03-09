import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:lazemna/data/GetItems.dart';

class ExpenseItems extends StatelessWidget{
  final databaseReference = Firestore.instance;

// GetItems items= new GetItems();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    var expenses = items.getData();
//    print("list of expenses: $expenses");
    return StreamBuilder<QuerySnapshot>(
      stream: databaseReference.collection('expenses').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return new ListTile(
                  isThreeLine: true,
                  title: new Text(document['name']),
                  subtitle: new Text(document['price'].toString() + ' - ' + document['date'].toString()),
                );
              }).toList(),
            );
        }
      },
    );
  }

}

