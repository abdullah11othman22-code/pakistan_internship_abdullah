import 'package:flutter/material.dart';
import '../../../models/to_do_model_draft.dart';
import '../../../shared/core/database_helper.dart';


class TaskController extends ChangeNotifier {


  final DatabaseHelper db = DatabaseHelper.instance;


  List<TaskModel> tasks = [];


  int currentState = 0;


  bool isLoading = false;



  Future<void> loadTasks() async {

    isLoading = true;

    notifyListeners();


    tasks = await db.getTasks();


    isLoading = false;

    notifyListeners();

  }



  Future<void> addTask(TaskModel task) async {

    await db.insertTask(task);

    await loadTasks();

  }



  Future<void> deleteTask(TaskModel task) async {

    await db.deleteTask(task.id!);

    await loadTasks();

  }



  Future<void> editTask(TaskModel task) async {

    await db.updateTask(task);

    await loadTasks();

  }



  Future<void> saveTask(
      TaskModel? oldTask,
      TaskModel newTask,
      ) async {


    if(oldTask == null){

      await addTask(newTask);

    }else{

      final updatedTask = TaskModel(

        id: oldTask.id,

        title: newTask.title,

        description: newTask.description,

        dateTime: newTask.dateTime,

        state: newTask.state,

      );


      await editTask(updatedTask);

    }

  }




  void changeState(int value){

    currentState = value;

    notifyListeners();

  }



  List<TaskModel> get filteredTasks {


    if(currentState == 0){

      return tasks;

    }


    return tasks.where(
            (task)=> task.state ==
            TaskStateEnum.values[currentState]
    ).toList();


  }


}