import 'package:flutter/material.dart';
import 'package:lazemna/data/addItem.dart';

class AddItem extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddItemState();
  }
}

class AddItemState extends State<AddItem> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  String itemName;
  double itemPrice;
  AddItemToFirestore item;


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    myController2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: const Text('Expens Item'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: TextField(
                controller: myController1,
                autocorrect: false, // turns off auto-correct
                decoration: InputDecoration(
                  hintText: 'item name...',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: TextField(
                controller: myController2,
                autocorrect: false, // turns off auto-correct
                decoration: InputDecoration(
                  hintText: 'item price...',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.indigo,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                itemName = myController1.text;
                itemPrice = double.parse(myController2.text);
                item = new AddItemToFirestore(itemName,itemPrice);
                item.add();
                Navigator.pop(context);
              },
              child: Text(
                "add",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          )
        ],
      ),
    );
  }

}




