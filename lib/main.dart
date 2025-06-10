import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/task_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
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
    final cubitController = context.read<TaskCubit>();
    TextEditingController taskController = TextEditingController();

    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 40,
                ),
                child: TextField(
                  controller: taskController,
                  decoration: InputDecoration(
                    hintText: 'add task',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (taskController.text.isEmpty) return;
                  cubitController.addTask(taskController.text);
                  taskController.clear();
                },
                child: Text('SAVE'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.taskList.length,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      title: Text('${state.taskList[index].title}'),
                      trailing: IconButton(
                        onPressed: () {
                          cubitController.deleteTask(state.taskList[index].id);
                        },
                        icon: Icon(Icons.delete),
                      ),
                      leading: Checkbox(
                        value: state.taskList[index].isCompleted,
                        onChanged: (value) {
                          cubitController.toggeleTask(state.taskList[index].id);
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
