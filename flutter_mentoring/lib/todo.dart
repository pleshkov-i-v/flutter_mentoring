class ToDo {
  ToDo(this.userId, this.id, this.title, this.completed);

  final int userId;
  final int id;
  final String title;
  final bool completed;

  ToDo.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        completed = json['completed'];
}