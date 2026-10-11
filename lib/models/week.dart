import 'package:flutter/cupertino.dart';
import 'package:project1/models/task.dart';

class Week {
  String title;
  Widget? screen;
  List<Task>? tasks;



  Week({required this.title, this.screen, this.tasks});

}