part of 'task_cubit.dart';

sealed class TaskState extends Equatable {
  final List<TaskModel> taskList;

  const TaskState(this.taskList);

  @override
  List<Object> get props => [];
}

final class TaskInitial extends TaskState {
  TaskInitial(super.taskList);
}
