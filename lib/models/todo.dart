class Todo {
  String id;
  String description;
  bool isDone;

  Todo(String id, String description, bool isDone) {
    this.id = id;
    this.description = description;
    this.isDone = isDone || false;
  }
}
