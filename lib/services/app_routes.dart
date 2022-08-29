import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/tasks_screen.dart';

import '../screens/recycle_bin.dart';
class AppRoute{
  Route? onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case RecycleBin.id:
        return MaterialPageRoute(
            builder: (_)=>RecycleBin());
      case TasksScreen.id:
        return MaterialPageRoute(
            builder: (_)=>TasksScreen());
      default:
        return null;
    }
  }
}