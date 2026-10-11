import 'package:flutter/material.dart';
import 'package:project1/models/task.dart';
import 'package:project1/shared/widgets/task_view.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final int numberWeek;

  const TaskCard({super.key, required this.task, required this.numberWeek});

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
      onTap: () {
        Navigator.push(
          context,

          MaterialPageRoute(
            builder: (_) {
              return TaskView(numberWeek: numberWeek, task: task);
            },
          ),
        );
      },

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,

          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple,
              blurRadius: 3,
              spreadRadius: 2,
              offset: Offset(-1, 0),
            ),
          ],
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(task.taskId, style: TextStyle(fontWeight: FontWeight.bold)),

              SizedBox(height: 8),

              Text(
                task.title,
                //overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 12),

              Text(task.state,style: TextStyle(color: Colors.green),),
            ],
          ),
        ),
      ),
    );
  }
}
