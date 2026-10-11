import 'package:flutter/cupertino.dart';

class Task {
  String taskId;
  String title;
  int? numberWeek;
  String state;
  Widget? screen;


  Task({ this.numberWeek,required this.taskId, this.screen,required this.state,required this.title});
}