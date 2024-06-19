import 'package:faztodo/model/model.dart';
import 'package:faztodo/provider/provider.dart';
import 'package:flutter/material.dart';

Future<void> showEditDialog(
    BuildContext context, int index, TodoProvider provider) async {
  final todo = provider.todos[index];
  String title = todo.title;
  String? description = todo.description;
  TextEditingController titleController = TextEditingController(text: title);
  TextEditingController descriptionController =
      TextEditingController(text: description);

  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Edit Todo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Title'),
            controller: titleController,
            onChanged: (value) {
              title = value;
            },
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Description'),
            controller: descriptionController,
            onChanged: (value) {
              description = value;
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            provider.editTodo(
                index,
                Todo(
                  title: title,
                  description: description,
                  isDone: todo.isDone,
                ));
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
        TextButton(
          onPressed: () {
            provider.deleteTodo(index);
            Navigator.pop(context);
          },
          child: const Text('Delete'),
        ),
      ],
    ),
  );
}
