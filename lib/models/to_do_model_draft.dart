import 'package:flutter/material.dart';

enum TaskStateEnum { all, toDo, processing, finished }


class TaskModel {

  final int? id;
  final String title;
  final String description;
  final DateTime dateTime;
  final TaskStateEnum state;


  TaskModel({
    this.id,
    required this.title,
    required this.description,
    DateTime? dateTime,
    this.state = TaskStateEnum.toDo,
  }) : dateTime = dateTime ?? DateTime.now();



  // تحويل المودل إلى بيانات SQLite
  Map<String, dynamic> toMap() {

    return {

      'title': title,

      'description': description,

      'dateTime': dateTime.toIso8601String(),

      'state': state.index,

    };

  }



  // تحويل بيانات SQLite إلى مودل
  factory TaskModel.fromMap(Map<String, dynamic> map) {

    return TaskModel(

      id: map['id'],

      title: map['title'],

      description: map['description'],

      dateTime: DateTime.parse(map['dateTime']),

      state: TaskStateEnum.values[map['state']],

    );

  }

}



class StateModel {

  final TaskStateEnum state;

  final Widget screen;


  const StateModel({
    required this.state,
    required this.screen,
  });

}



extension TaskStateExtension on TaskStateEnum {

  String get title {

    switch (this) {

      case TaskStateEnum.all:
        return 'All';

      case TaskStateEnum.toDo:
        return 'To Do';

      case TaskStateEnum.processing:
        return 'Processing';

      case TaskStateEnum.finished:
        return 'Finished';

    }

  }



  Color get color {

    switch (this) {

      case TaskStateEnum.all:
        return Colors.deepPurple;

      case TaskStateEnum.toDo:
        return Colors.red;

      case TaskStateEnum.processing:
        return Colors.amber;

      case TaskStateEnum.finished:
        return Colors.blue;

    }

  }

}