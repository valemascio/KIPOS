/*
      appBar: AppBar(
        title: const Text('Tips'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(255, 34, 175, 34),
      ),
      body: */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Task {
  final String task_name;
  final String description;

  Task(this.task_name, this.description);
}

// Home screen
class TipsPage extends StatelessWidget {
  final List<Task> tasks;

  const TipsPage({Key? key, required this.tasks}) : super(key: key);

  static const route = '/tips/';
  static const routename = 'TipsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tips'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(255, 34, 175, 34),
      ),
      // List builder
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].task_name),
            trailing: const Icon(
              Icons.arrow_right,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(task: tasks[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// detail screen
class DetailScreen extends StatelessWidget {
  final Task task;
  const DetailScreen({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.task_name),
        backgroundColor: Color.fromARGB(255, 34, 175, 34),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(task.description),
      ),
    );
  }
}
