import 'package:flutter/material.dart';
import 'package:project1/models/to_do_model_draft.dart';
import 'package:project1/screens/week4/widget/screens/week4/widget/add_task_button.dart';
import 'package:project1/screens/week4/widget/screens/week4/widget/dialog_helper.dart';
import 'package:project1/screens/week4/widget/screens/week4/widget/task_filter.dart';
import 'package:project1/screens/week4/widget/screens/week4/widget/task_list.dart';
import 'package:project1/screens/week4/widget/screens/week4/widget/task_section.dart';

import 'controller/controller.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key, required this.stateModel});

  final List<StateModel> stateModel;

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final TaskController controller = TaskController();

  bool startTopAnimation = false;
  bool startBottomAnimation = false;

  @override
  void initState() {
    super.initState();


    // تحميل البيانات من SQLite
    controller.addListener(() {
      setState(() {});
    });

    controller.loadTasks();



    // Animation
    Future.delayed(const Duration(milliseconds: 200), () {

      if (!mounted) return;

      setState(() {
        startTopAnimation = true;
      });

    });



    Future.delayed(const Duration(milliseconds: 1500), () {

      if (!mounted) return;

      setState(() {
        startBottomAnimation = true;
      });

    });

  }
  void openTaskDialog({TaskModel? task}) {
    showTaskDialog(
      context: context,

      task: task,

      onSave: (newTask) {
        controller.saveTask(task, newTask);


      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = controller.filteredTasks;

    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),

              const Text(
                'To Do List',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 20),

              TaskSection(
                startTopAnimation: startTopAnimation,
                startBottomAnimation: startBottomAnimation,

                topChild: TaskFilter(
                  stateModel: widget.stateModel,
                  currentState: controller.currentState,

                  onChanged: (value) {
                    controller.changeState(value);


                  },
                ),

                bottomChild: TaskList(
                  tasks: filteredList,

                  onDelete: (task) {
                    controller.deleteTask(task);

                  
                  },

                  onEdit: (task) {
                    openTaskDialog(task: task);
                  },
                ),
              ),
            ],
          ),

          Positioned(
            right: 20,
            bottom: 20,

            child: AddTaskButton(
              onTap: () {
                openTaskDialog();
              },
            ),
          ),
        ],
      ),
    );
  }
}
