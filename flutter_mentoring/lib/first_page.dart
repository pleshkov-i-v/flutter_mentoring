import 'package:flutter/material.dart';
import 'package:fluttermentoring/second_page.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _showExitDialog(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: RawMaterialButton(
            fillColor: Theme.of(context).accentColor,
            textStyle: TextStyle(color: Colors.white),
            constraints: BoxConstraints.tightFor(width: 100, height: 50),
            child: Center(
              child: Text("Go next"),
            ),
            onPressed: () async {
              var answer = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SecondPage(title: "Second Page")),
              );
              _showResultDialog(context, answer);
            },
          ),
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
        )
    );
    return result;
  }
}
