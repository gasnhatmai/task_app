import 'package:flutter/material.dart';
import '../blocs/blocs_export.dart';
import '../models/tasks.dart';
class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;
  void _removeOrDeleteTask(BuildContext ctx,Task task){
    task.isDelete!?
        ctx.read<TaskBloc>().add(DeleteTask(task: task)):
        ctx.read<TaskBloc>().add(RemoveTask(task: task));
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title,
        style: TextStyle(
            decoration: task.isDone!?TextDecoration.lineThrough:TextDecoration.none
        ),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: (bool? value) {
          context.read<TaskBloc>().add(UpdateTask(task: task));
        },
      ),
      onLongPress: ()=>_removeOrDeleteTask(context, task),
    );
  }
}