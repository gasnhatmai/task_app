import 'package:flutter/material.dart';
import '../blocs/blocs_export.dart';
import '../models/tasks.dart';
class AddTaskScreen extends StatelessWidget {
 AddTaskScreen({
    Key? key
  }) : super(key: key);
 TextEditingController titleController=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 40),
      child: Column(
        children: [
          const Text('Add Task'),
          SizedBox(height: 10,),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(
                )
            ),
          ),
          Row(

            children: [
              TextButton(
                  onPressed: ()=>Navigator.pop(context),
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: (){
                var task=Task(title: titleController.text);
                context.read<TaskBloc>().add(AddTask(task: task));
                Navigator.pop(context);
              },
                  child: const Text('Add'))
            ],
          )

        ],
      ),
    );
  }
}