//controller dari model Task
//berisi method2 yang akan dimanfaatkan di screen
import 'package:flutter/cupertino.dart';
import 'package:taskamanger_app/models/task.dart';
import 'package:provider/provider.dart';

class TaskOperation extends ChangeNotifier{
  //
  List<Task> _task = [];
  List<Task> get getTasks{
    return _task;
  }

  TaskOperation(){
    addNewTask('First Task', 'First Task Description');
  }

  void addNewTask(String title, String description){
    Task task = Task(title, description);
    _task.add(task);
    notifyListeners(); //menginformasikan ada sebuah task ditambahkan sehingga semua bagia yang menggunakan elemen Task akan diinformasikan dan dapat mengalami perubahan
  }

  void getTask(){

  }

}