import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/blocs_export.dart';
import 'package:flutter_tasks_app/screens/mydrawer.dart';

import '../models/tasks.dart';
import '../widgets/taks_list.dart';
import 'package:flutter/cupertino.dart';

import 'add_task_screen.dart';
class TasksScreen extends StatefulWidget {
  TasksScreen({Key? key}) : super(key: key);
  static const id='task_screen';

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  void _addTask(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (context)=>
            SingleChildScrollView(
              child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom
              ),
                child: AddTaskScreen()
              ),
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc,TaskState>(
      builder: (context,state){
        List<Task> taskList=state.allTask;
       return Scaffold(
        appBar: AppBar(
        title: const Text('Tasks App'),
        actions: [
        IconButton(
        onPressed: ()=>_addTask(context),
        icon: const Icon(Icons.add),
        )
        ],
        ),
        drawer: MyDrawer(),
        body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
        Center(
        child: Chip(
        label: Text(
        '${state.allTask.length} Tasks:',

        ),
        ),
        ),
        TaskList(taskList: taskList)
        ],
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: ()=> _addTask(context)
        ,
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
        ),
        );
      },

    );
  }
}




