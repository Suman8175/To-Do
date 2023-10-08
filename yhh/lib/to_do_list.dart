import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('To Do List', style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
      ),
      body: const Center(child: Text('Hello User!')),
    );
  }
}
