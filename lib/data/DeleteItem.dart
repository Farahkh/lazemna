import 'package:cloud_firestore/cloud_firestore.dart';

class DeleteItem{
  void _delete() {
    Firestore.instance.collection('expenses')
        .document().delete().whenComplete(() {
      print("Deleted Successfully");
    }).catchError((e) => print(e));
  }
}
