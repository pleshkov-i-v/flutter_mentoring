import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 3;
  List<MyListItem> _items = List<MyListItem>();

  void _incrementCounter() {
    setState(() {
      _counter++;
      _items.add(MyListItem(_counter, 'Item $_counter'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 80,
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text("Text input example: "),
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Enter text here:',
                        helperText: 'Text field',
                        labelText: 'this is a textfield'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _counter,
              itemBuilder: (BuildContext context, int index) {
                var item = _items[index];
                return ListTile(
                  leading: Icon(Icons.redeem),
                  title: Text(item.title),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyListItem {
  MyListItem(this.index, this.title);

  final int index;
  final String title;
}
