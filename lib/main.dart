import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskamanger_app/models/task_operation.dart';
import 'package:taskamanger_app/screen/add_screen.dart';
import 'package:taskamanger_app/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskOperation>(
      create: (context) => TaskOperation(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
