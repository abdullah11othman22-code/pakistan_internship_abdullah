import 'package:flutter/material.dart';
import 'package:project1/models/task.dart';

class TaskView extends StatelessWidget {
  const TaskView(  {super.key,  this.task, required this.numberWeek});
final int numberWeek;
final Task? task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon( Icons.arrow_back,color: Colors.white,)),
        centerTitle: true,
        title: Text(task!.title, style: TextStyle(color: Colors.white)),
      ),
      body: task?.screen,
    );
  }
}
