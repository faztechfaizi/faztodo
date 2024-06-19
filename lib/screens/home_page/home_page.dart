import 'package:faztodo/provider/provider.dart';
import 'package:faztodo/widget/add_todo_dialog.dart';
import 'package:faztodo/widget/edit_todo_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    final todos = provider.todos;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Image.asset(
            'assets/images/todologo.png',
            height: 130,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration:
                          todo.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  subtitle: Text(
                    todo.description ?? '',
                    style: TextStyle(
                      decoration:
                          todo.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          showEditDialog(context, index, provider);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          provider.deleteTodo(index);
                        },
                      ),
                      Checkbox(
                        value: todo.isDone,
                        onChanged: (value) {
                          provider.toggleTodoStatus(index);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddDialog(context, provider);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
