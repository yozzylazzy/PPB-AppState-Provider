import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskamanger_app/models/task_operation.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String titleText = '';
    String descriptionText = '';
    TextEditingController titleTask = TextEditingController();
    TextEditingController descriptionTask = TextEditingController();
    TextEditingController dateTask = TextEditingController();

    return Scaffold(
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
        body: Form(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: titleTask,
                    decoration: InputDecoration(
                      //contentPadding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 10.0),
                      labelText: 'Title',
                      labelStyle: TextStyle(
                        color: Colors.black,  fontSize: 20, fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: descriptionTask,
                    decoration: InputDecoration(
                      //contentPadding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 10.0),
                      labelText: 'Description',
                      labelStyle: TextStyle(
                        color: Colors.black,  fontSize: 20, fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  SizedBox(height: 70,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      fixedSize: Size(150.0, 50.0),
                      shadowColor: Colors.lightBlueAccent,
                    ),
                    child: Text('Add Task'),
                    onPressed: (){
                      titleText = titleTask.text;
                      descriptionText = descriptionTask.text;

                  Provider.of<TaskOperation>(context, listen: false).addNewTask(titleText, descriptionText, DateTime.now());
                  Navigator.pop(context);
                   },
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
