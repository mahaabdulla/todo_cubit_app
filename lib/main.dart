import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/task_bloc.dart';
import 'package:todo_app/bloc/task_event.dart';
import 'package:todo_app/bloc/task_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final blocController = context.read<TaskBloc>();
    TextEditingController taskController = TextEditingController();

    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 100,
                  bottom: 10,
                  right: 20,
                  left: 20,
                ),
                child: TextField(
                  controller: taskController,
                  decoration: const InputDecoration(
                    hintText: 'Add task',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (taskController.text.isEmpty) return;
                  blocController.add(AddTask(taskController.text));
                  taskController.clear();
                },
                child: const Text('SAVE'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.tasks.length,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      title: Text(state.tasks[index].title),
                      trailing: IconButton(
                        onPressed: () {
                          blocController.add(DeleteTask(state.tasks[index].id));
                        },
                        icon: const Icon(Icons.delete),
                      ),
                      leading: Checkbox(
                        value: state.tasks[index].isCompleted,
                        onChanged: (value) {
                          blocController.add(ToggleTask(state.tasks[index].id));
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
