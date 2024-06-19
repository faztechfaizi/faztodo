import 'package:flutter/material.dart';
import 'package:faztodo/model/model.dart';
import 'package:faztodo/util/shared_pref.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  // Initializes the todos by loading them from SharedPreferences.
  TodoProvider() {
    _loadTodos();
  }

  // Loads the todos from SharedPreferences and notifies listeners.
  void _loadTodos() {
    SharedPreferencesUtil.getTodos().then((value) {
      _todos = value;
      notifyListeners();
    });
  }

  // Adds a new todo to the list and saves it to SharedPreferences.

  Future<void> addTodo(Todo todo) async {
    _todos.add(todo);
    notifyListeners();
    await SharedPreferencesUtil.saveTodos(_todos);
  }

  // Edits an existing todo in the list and saves it to SharedPreferences.

  Future<void> editTodo(int index, Todo todo) async {
    _todos[index] = todo;
    notifyListeners();
    await SharedPreferencesUtil.saveTodos(_todos);
  }

  // Deletes a todo from the list and saves it to SharedPreferences.

  void deleteTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
    SharedPreferencesUtil.saveTodos(_todos);
  }

  // Toggles the status of a todo and saves it to SharedPreferences.

  void toggleTodoStatus(int index) {
    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
    SharedPreferencesUtil.saveTodos(_todos);
  }

  // Returns the list of todos.
  List<Todo> get todos => _todos;
}
