import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/model/task.dart';
import 'package:uuid/uuid.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  addTask(String title) {
    final model = TaskModel(id: Uuid().v4(), title: title, isCompleted: false);
    emit(UpdateTask([...state.taskList, model]));
  }

  deleteTask(String id) {
    List<TaskModel> tasks =
        state.taskList.where((taskId) => taskId.id != id).toList();
    emit(UpdateTask(tasks));
  }

  toggeleTask(String id) {
    final List<TaskModel> newList =
        state.taskList.map((task) {
          return task.id == id
              ? task.copyWith(isCompleted: !task.isCompleted)
              : task;
        }).toList();

    emit(UpdateTask(newList));
  }
}
