import 'package:flutter/material.dart';
import '../../../../../../models/to_do_model_draft.dart';
import 'dialog.dart';



void showTaskDialog({
  required BuildContext context,
  TaskModel? task,
  required Function(TaskModel task) onSave,
}){

  showDialog(

    context: context,

    builder: (context){

      return TaskDialog(

        task: task,

        onSave: onSave,

      );

    },

  );

}