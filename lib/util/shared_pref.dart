import 'dart:convert';

import 'package:faztodo/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
//SharedPreferencesUtil.getTodos() - get list of todos from shared preferences

  static Future<List<Todo>> getTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final todosString = prefs.getString('todos') ?? '[]';
    final List<dynamic> todosJson = jsonDecode(todosString);
    return todosJson.map((json) => Todo.fromMap(json)).toList();
  }

  // SharedPreferencesUtil.saveTodos(List<Todo> todos) - save list of todos to shared preferences

  static Future<void> saveTodos(List<Todo> todos) async {
    final prefs = await SharedPreferences.getInstance();
    final todosString = jsonEncode(todos.map((todo) => todo.toMap()).toList());
    prefs.setString('todos', todosString);
  }
}
