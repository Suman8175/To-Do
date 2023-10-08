import 'package:flutter/material.dart';
import 'package:yhh/ListOfItem/todo.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  var titlec = TextEditingController();
  var descc = TextEditingController();

  void fillTask() async {
    return showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          title: const Text('Add New Task'),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          content: SizedBox(
            height: 350,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextField(
                  controller: titlec,
                  style: const TextStyle(fontSize: 20),
                  maxLines: 1,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      alignLabelWithHint: true,
                      label: Text(
                        'Task Title',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      hintText: 'Enter your task title',
                      hintStyle: TextStyle(fontSize: 16)),
                ),
                Expanded(
                  child: TextField(
                    controller: descc,
                    style: const TextStyle(fontSize: 16),
                    maxLines: 4,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      alignLabelWithHint: true,
                      label: Text(
                        'Task Detail',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      hintText: 'Enter your task in detail here',
                      hintStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        var title = titlec.text;
                        var desc = descc.text;
                        toDoList.add({'title': title, 'desc': desc});
                        titlec.text = '';
                        descc.text = '';
                        for (var index in toDoList) {
                          debugPrint(index['title']);
                          debugPrint(index['desc']);
                        }
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  child: const Text('Add'),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('To Do List', style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 7,
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.amber,
                  width: 2.5, // Underline thickness
                ),
              ),
            ),
            child: const Text(
              'Today\'s Task',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: toDoList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: ListTile(
                      horizontalTitleGap: 50.0,
                      leading: const Icon(
                        Icons.task,
                        size: 32,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 24),
                      title: Text(
                        toDoList[index]['title'],
                      ),
                      subtitle: Text(
                        toDoList[index]['desc'],
                        maxLines: 3,
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                      iconColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fillTask,
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
    );
  }
}
