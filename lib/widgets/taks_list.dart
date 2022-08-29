import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/widgets/task_tittle.dart';
import '../blocs/blocs_export.dart';
import '../models/tasks.dart';
class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context,index){
              var task=taskList[index];
              return TaskTile(task: task);
            })
    );
  }
}

