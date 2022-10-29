import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskamanger_app/models/task.dart';
import 'package:taskamanger_app/models/task_operation.dart';
import 'package:taskamanger_app/screen/add_screen.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  //List<String> litask = TaskOp

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text('TASK MANAGER LITE',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
      ),
      // body: ChangeNotifierProvider(
      //   create: (context) => new TaskOperation(),
      //   builder: (context,child){
      //     return Text(context.watch<TaskOperation>().toString());
      //   },
      // )
      // ,

      //Consumer membuat home_screen stadnby siapa tau ada perubahan
      body: Consumer<TaskOperation>(
        builder: (context, TaskOperation data, child){
          return ListView.builder(
              itemCount: data.getTasks.length,
              itemBuilder: (context, index) {
            return TasksCard(data.getTasks[index]);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => AddScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  
}

class TasksCard extends StatelessWidget {
  final Task task;
  TasksCard(this.task);

  @override
  Widget build(Object context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(task.title,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          const SizedBox(height: 5,),
          Text(task.description,style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
          const SizedBox(height: 5,),
          Text(task.date.toString(),style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}

