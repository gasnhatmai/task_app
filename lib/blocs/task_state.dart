part of 'task_bloc.dart';

@immutable
 class TaskState extends Equatable{
  final List<Task> allTask;
  final List<Task> removeTask;
  const TaskState({
    this.allTask=const <Task>[],
    this.removeTask=const <Task>[]
});

  @override
  List<Object?> get props =>[allTask];


}


