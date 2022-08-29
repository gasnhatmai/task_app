

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tasks_app/blocs/blocs_export.dart';
import 'package:meta/meta.dart';

import '../models/tasks.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {

      on<AddTask>(_onAddTask);
      on<UpdateTask>(_onUpdateTask);
      on<DeleteTask>(_onDeleteTask);
      on<RemoveTask>(_onRemoveTask);
    }

  void _onAddTask(AddTask event , Emitter<TaskState> emitter){
   final state=this.state;
   emit(TaskState(
     allTask: List.from(state.allTask)..add(event.task)
   ));
  }
  void _onDeleteTask(DeleteTask event , Emitter<TaskState> emitter){
    final state=this.state;
    emit(TaskState(
        allTask: List.from(state.allTask)..remove(event.task)
    ));
  }
  void _onRemoveTask(RemoveTask event , Emitter<TaskState> emitter){
    final state=this.state;
    emit(TaskState(
        allTask: List.from(state.allTask)..remove(event.task),
        removeTask: List.from(state.removeTask)..add(event.task.copyWith(isDelete: true))
    ));
  }
  void _onUpdateTask(UpdateTask event , Emitter<TaskState> emitter){
    final state=this.state;
    final task=event.task;
    final index=state.allTask.indexOf(task);
    List<Task> allTask=List.from(state.allTask)..remove(task);
    task.isDone==false?
    allTask.insert(index,task.copyWith(isDone: true)):
        allTask.insert(index,task.copyWith(isDone: false));
    emit(TaskState(
        allTask: allTask
    ));
  }


}
