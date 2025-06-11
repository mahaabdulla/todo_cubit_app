import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/task_event.dart';
import 'package:todo_app/bloc/task_state.dart';
import 'package:todo_app/model/task.dart';
import 'package:uuid/uuid.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<AddTask>(_onAddTask);
    on<DeleteTask>(_onDeleteTask);
    on<ToggleTask>(_onToggleTask);
  }

  _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final newList = TaskModel(
      id: Uuid().v4(),
      title: event.title,
      isCompleted: false,
    );
    emit(UpdateTask([...state.tasks, newList]));
  }

  _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final tasks = state.tasks.where((task) => task.id != event.id).toList();
    emit(UpdateTask(tasks));
  }

  _onToggleTask(ToggleTask event, Emitter<TaskState> emit) {
    final updatedList =
        state.tasks.map((task) {
          return task.id == event.id
              ? task.copyWith(isCompleted: !task.isCompleted)
              : task;
        }).toList();

    emit(UpdateTask(updatedList));
  }
}
