import 'package:flutter/material.dart';
import 'package:fluttermentoring/second_page.dart';
import 'todo.dart';

class FirstPage extends StatefulWidget {
  final String title;

  FirstPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FirstPageState(title: title);
  }
}

class _FirstPageState extends State<FirstPage> {
  _FirstPageState({this.title});

  String title;
  ToDo selectedItem;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _showExitDialog(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            RawMaterialButton(
              padding: EdgeInsets.all(30),
              fillColor: Theme.of(context).accentColor,
              textStyle: TextStyle(color: Colors.white),
              child: Center(
                child: Text("GO TO 2nd SCREEN"),
              ),
              onPressed: () async {
                var answer = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondPage(title: "Second Page")),
                );
                setState(() {
                  selectedItem = answer is ToDo ? answer : null;
                });

              },
            ),
            selectedItem == null
                ? Center(
                  child: Text('No item to display.'),
                )
                : ListTile(
              title: Text(selectedItem.title),
              trailing: Icon(
                selectedItem.completed ? Icons.check_circle : Icons.check_circle_outline,
                color: selectedItem.completed ? Colors.green : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _showExitDialog(BuildContext context) async {
    var result = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Are you sure?"),
              content: Text("Do you really want to close the app?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Exit"),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
                FlatButton(
                  child: Text("Cancel"),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ],
            ));
    return result;
  }

  Future<bool> _showResultDialog(BuildContext context, String content) async {
    var result = await showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: Text(content),
            ));
    return result;
  }
}
