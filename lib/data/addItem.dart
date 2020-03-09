import 'package:cloud_firestore/cloud_firestore.dart';

class AddItemToFirestore{
  String itemName;
  double itemPrice;
  String date;

  AddItemToFirestore(this.itemName, this.itemPrice){
    date=DateTime.now().toString();
  }

  void add(){
    Firestore.instance.collection('expenses')
        .document()
        .setData(
        { 'name':itemName,
          'price':itemPrice,
          'date':date
        }).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
  }
}