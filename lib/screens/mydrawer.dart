import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/blocs_export.dart';
import 'package:flutter_tasks_app/screens/recycle_bin.dart';
import 'package:flutter_tasks_app/screens/tasks_screen.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Column(
            children: [
              Container(
                color: Colors.grey,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: const Text('Task Drawer'),
              ),
              BlocBuilder<TaskBloc,TaskState>(
                builder:(context,state) {
                  return GestureDetector(
                    child:  ListTile(
                      leading: Icon(Icons.folder_special),
                      title: Text('My Task'),
                      trailing: Text('${state.allTask.length}'),
                    ),
                    onTap: () =>
                        Navigator.of(context).pushNamed(TasksScreen.id),
                  );
                }
              ),
              BlocBuilder<TaskBloc,TaskState>(
                builder: (context,state){
                return GestureDetector(
                child:  ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Recycle BIn'),
                  trailing:  Text('${state.removeTask.length}'),
                ),
                onTap: ()=>Navigator.of(context).pushNamed(RecycleBin.id),
              );
                },
              )
            ],
          )

      ),
    );
  }
}
