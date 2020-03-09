import 'package:cloud_firestore/cloud_firestore.dart';
class GetItems{
  final databaseReference = Firestore.instance;
  List items = new List();

//  List getData() {
//    databaseReference
//        .collection("expenses")
//        .getDocuments()
//        .then((QuerySnapshot snapshot) {
//      snapshot.documents.forEach((f) => items.add(f.data));
//    });
//    print("GetItems list: $items");
//    return nu/ll;
  }

