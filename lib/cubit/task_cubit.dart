import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/model/task.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  addTask(TaskModel title) {
    emit(UpdateTask([...state.taskList, title]));
  }

  deleteTask(int id) {
    List<TaskModel> tasks =
        state.taskList.where((taskId) => taskId.id != id).toList();
    emit(UpdateTask(tasks));
  }

  toggeleTask(int id) {
    final List<TaskModel> newList =
        state.taskList.map((task) {
          return task.id == id
              ? task.copyWith(isCompleted: !task.isCompleted)
              : task;
        }).toList();

    emit(UpdateTask(newList));
  }
}
