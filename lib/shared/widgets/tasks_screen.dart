import 'package:flutter/material.dart';
import 'package:project1/models/week.dart';
import 'package:project1/shared/core/constant.dart';
import 'package:project1/shared/widgets/task_view.dart';

import '../../models/task.dart';
import 'Wedgets/task_card.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key, required this.numberWeek});

  final int numberWeek;

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    Week thisWeek = weeks[widget.numberWeek - 1];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,

        title: Text(thisWeek.title, style: TextStyle(color: Colors.white)),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),

        child: Center(
          child: thisWeek.tasks == null
              ? Text('لا يوجد بيانات')
              : GridView.builder(
                  itemCount: thisWeek.tasks!.length,

                  itemBuilder: (BuildContext context, int index) {
                    Task task = thisWeek.tasks![index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => TaskView(
                              numberWeek: widget.numberWeek,
                              task: task,
                            ),
                          ),
                        );
                      },

                      child:
                        TaskCard(task: task, numberWeek: widget.numberWeek)
                    );
                  },

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                  ),
                ),
        ),
      ),
    );
  }
}
