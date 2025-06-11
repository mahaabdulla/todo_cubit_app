import 'package:equatable/equatable.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TaskEvent {
  final String title;
  const AddTask(this.title);

  @override
  List<Object> get props => [title];
}

class DeleteTask extends TaskEvent {
  final String id;
  const DeleteTask(this.id);

  @override
  List<Object> get props => [id];
}

class ToggleTask extends TaskEvent {
  final String id;
  const ToggleTask(this.id);

  @override
  List<Object> get props => [id];
}
