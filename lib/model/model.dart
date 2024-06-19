/// A class representing a Todo item.
///
/// It has properties [title], [description], and [isDone].
class Todo {
  final String title;

  final String? description;

  bool isDone;

  Todo({required this.title, this.description, this.isDone = false});

  // Converts the Todo instance to a Map.

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }

  /// Creates a Todo instance from a Map.

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'],
      description: map['description'],
      isDone: map['isDone'],
    );
  }
}
