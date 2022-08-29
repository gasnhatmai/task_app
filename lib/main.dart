import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/services/app_routes.dart';
import 'blocs/blocs_export.dart';
import 'screens/tasks_screen.dart';

void main() async {

  BlocOverrides.runZoned(
            () => runApp(MyApp(appRoute: AppRoute())),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRoute}) : super(key: key);
  final AppRoute appRoute;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>TaskBloc(),
      child: MaterialApp(
        title: 'Flutter Tasks App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  TasksScreen(),
        onGenerateRoute: appRoute.onGenerateRoute,
      ),
    );
  }
}
