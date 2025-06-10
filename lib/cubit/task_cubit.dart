import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/model/task.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  void addTask(TaskModel title) {
    List<TaskModel> task;
    // task.map((e) => e.title,).toList();
    //  emit(UpdateTask(task));
  }

  void deleteTask(int id) {}
  void toggeleTask(bool isCompleted) {}
}
