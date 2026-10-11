// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// class ToDoModel {
//   final int id;
//   final String title;
//   final String description;
//   final DateTime deadLine;
//   final StateModel stateModel;
//
//   ToDoModel({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.deadLine,
//     required this.stateModel,
//   });
// }
//
//
// bool addTask({required ToDoModel toDoModel}) {
//   List<ToDoModel>toDoList = [];
//   if (toDoModel.title.length > 10 && toDoModel.description.length < 50) {
//     toDoList.add(toDoModel);
//     return true;
//   }
//   else {
//     return false;
//   }
// }
//
// bool deleteTask({required int id}) {
//   List<ToDoModel>toDoList = [];
//   if (id > 0) {
//     toDoList.removeWhere((item) {
//       return item.id == id;
//     });
//     return true;
//   }
//   else {
//     return false;
//   }
// }
//
// class StateModel {
//   final List<String> stateToDo = [
//     'All',
//     'To Do',
//     'Processing',
//     'Finished',
//   ];
//   final List<int> indixState = [0, 1, 2, 3];
//   final Widget screen;
//
//   StateModel({
//     required this.screen
//   });
//
// }