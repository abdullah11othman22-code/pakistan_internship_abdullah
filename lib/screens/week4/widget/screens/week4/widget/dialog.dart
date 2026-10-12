import 'package:flutter/material.dart';
import 'package:project1/models/to_do_model_draft.dart';
import 'package:project1/shared/widgets/Wedgets/main_button.dart';
import 'package:project1/shared/widgets/custom_textfeild.dart';

class TaskDialog extends StatefulWidget {
  const TaskDialog({
    super.key,
    this.task,
    required this.onSave,
  });

  final TaskModel? task;
  final Function(TaskModel task) onSave;

  @override
  State<TaskDialog> createState() => _TaskDialogState();
}


class _TaskDialogState extends State<TaskDialog> {

  late TextEditingController title;
  late TextEditingController description;

  DateTime? selectedDate;
  TaskStateEnum? selectedState;


  @override
  void initState() {
    super.initState();

    title = TextEditingController(
      text: widget.task?.title ?? "",
    );

    description = TextEditingController(
      text: widget.task?.description ?? "",
    );

    selectedDate = widget.task?.dateTime;

    selectedState = widget.task?.state ?? TaskStateEnum.toDo;
  }


  @override
  Widget build(BuildContext context) {

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(

          mainAxisSize: MainAxisSize.min,

          children: [

            CustomTextFeild(
              hint: "init project flutter",
              controller: title,
              title: "Title",
            ),


            const SizedBox(height: 10),


            CustomTextFeild(
              hint: "Do not miss this task",
              controller: description,
              title: "Description",
            ),


            const SizedBox(height: 10),


            DropdownButtonFormField<TaskStateEnum>(

              initialValue: selectedState,

              items: TaskStateEnum.values.map((state){

                return DropdownMenuItem(
                  value: state,
                  child: Text(state.title),
                );

              }).toList(),


              onChanged: (value){

                setState(() {
                  selectedState = value;
                });

              },

            ),


            const SizedBox(height: 15),


            MainButton(
              title: "Confirm",

              onTap: (){

                final task = TaskModel(

                  title: title.text,

                  description: description.text,

                  dateTime:
                  selectedDate ?? DateTime.now(),

                  state:
                  selectedState ?? TaskStateEnum.toDo,

                );


                widget.onSave(task);


                Navigator.pop(context);

              },
            )

          ],
        ),
      ),
    );
  }
}