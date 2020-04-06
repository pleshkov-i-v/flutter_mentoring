import 'package:flutter/material.dart';
import 'data_client.dart';
import 'todo.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key key, this.title}) : super(key: key);

  final String title;
  final _client = DataClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: FutureBuilder(
          future: _client.fetchTodos(),
          builder: (BuildContext context, AsyncSnapshot<List<ToDo>> snapshot) {
            if (snapshot.hasData) {
              return ToDosListView(
                items: snapshot.data,
                onItemSelected: (ToDo item) {
                  Navigator.of(context).pop(item);
                },
              );
            } else if (snapshot.hasError) {
              return getErrorView(snapshot.error.toString());
            } else {
              return getIndicatorView();
            }
          },
        ));
  }

  Widget getIndicatorView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            child: CircularProgressIndicator(),
            width: 60,
            height: 60,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text('Awaiting result...'),
          )
        ],
      ),
    );
  }

  Widget getErrorView(String errorText) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text('Error: $errorText'),
          )
        ],
      ),
    );
  }
}

class ToDosListView extends StatelessWidget {
  ToDosListView({Key key, @required this.items, @required this.onItemSelected}) : super(key: key);

  final List<ToDo> items;
  final Function(ToDo) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, i) {
        return ToDoItemView(
          item: items[i],
          onTap: onItemSelected,
        );
      },
    );
  }
}

class ToDoItemView extends StatelessWidget {
  ToDoItemView({Key key, @required this.item, @required this.onTap})
      : super(key: key);

  final ToDo item;
  final Function(ToDo) onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      trailing: Icon(
        item.completed ? Icons.check_circle : Icons.check_circle_outline,
        color: item.completed ? Colors.green : Colors.grey,
      ),
      onTap: _onTap,
    );
  }

  void _onTap() {
    onTap(item);
  }
}
