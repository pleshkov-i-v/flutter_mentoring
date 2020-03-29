import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RawMaterialButton(
              fillColor: Theme.of(context).accentColor,
              textStyle: TextStyle(color: Colors.white),
              constraints: BoxConstraints.tightFor(width: 100, height: 50),
              child: Center(
                child: Text("Return 42"),
              ),
              onPressed: (){
                Navigator.of(context).pop("42");
              },
            ),
            RawMaterialButton(
              fillColor: Theme.of(context).accentColor,
              textStyle: TextStyle(color: Colors.white),
              constraints: BoxConstraints.tightFor(width: 100, height: 50),
              child: Center(
                child: Text("Return AbErVaLlG", textAlign: TextAlign.center,),
              ),
              onPressed: () {
                Navigator.of(context).pop("AbErVaLlG");
              },
            ),
          ],
        ),
      ),
    );
  }
}
