import 'package:faztodo/model/model.dart';
import 'package:faztodo/provider/provider.dart';
import 'package:flutter/material.dart';

void showAddDialog(BuildContext context, TodoProvider provider) {
  String title = '';
  String description = '';

  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Add Todo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Title'),
            onChanged: (value) {
              title = value;
            },
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Description'),
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
            if (title.isNotEmpty) {
              provider.addTodo(Todo(
                title: title,
                description: description,
              ));
            }
            Navigator.pop(context);
          },
          child: const Text('Add'),
        ),
      ],
    ),
  );
}
