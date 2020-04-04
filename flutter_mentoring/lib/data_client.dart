import 'dart:convert';
import 'package:http/http.dart' as http;
import 'todo.dart';

class DataClient {
  Future<List<ToDo>> fetchTodos() async {
    var response =
        await http.get('https://jsonplaceholder.typicode.com/todos/');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var items = (json.decode(response.body) as Iterable)
          .map((t) => ToDo.fromJson(t))
          .toList();
      return items;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}


