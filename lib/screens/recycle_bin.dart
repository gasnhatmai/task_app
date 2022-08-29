import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/blocs_export.dart';

import '../widgets/taks_list.dart';
import 'mydrawer.dart';
class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
  static const id='recycle_bin_screnns';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc,TaskState>(
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              IconButton(
                onPressed: () {},
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
                    ' ${state.removeTask.length} Tasks:',

                  ),
                ),
              ),
              TaskList(taskList: state.removeTask)
            ],
          ),
        );
      }
    );
  }
}
