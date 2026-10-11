import 'package:flutter/material.dart';
import 'package:project1/models/to_do_model_draft.dart';
import 'package:project1/screens/week4/widget/screens/week4/widget/task_card.dart';


class TaskList extends StatelessWidget {

  const TaskList({
    super.key,
    required this.tasks,
    required this.onDelete,
    required this.onEdit,
  });


  final List<TaskModel> tasks;

  final Function(TaskModel task) onDelete;

  final Function(TaskModel task) onEdit;



  @override
  Widget build(BuildContext context) {


    if(tasks.isEmpty){

      return const Center(
        child: Text(
          'No tasks here 👀',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      );

    }



    return ListView.separated(

      separatorBuilder: (context,index){

        return const SizedBox(height: 0);

      },


      itemCount: tasks.length,


      itemBuilder: (context,index){

        final task = tasks[index];


        return Padding(

          padding: const EdgeInsets.all(12),


          child: ToDoCard(

            dateTime: task.dateTime,

            description: task.description,

            taskName: task.title,

            color: task.state.color,


            onDelete: (){

              onDelete(task);

            },


            onEdit: (){

              onEdit(task);

            },

          ),

        );

      },

    );

  }

}