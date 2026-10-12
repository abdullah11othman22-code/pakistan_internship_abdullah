import 'package:flutter/material.dart';

class ToDoCard extends StatefulWidget {
  const ToDoCard({
    super.key,
    this.color = Colors.deepPurple,
    required this.taskName,
    required this.description,
    required this.dateTime,
    required this.onDelete,
    required this.onEdit,
  });

  final Color color;
  final String taskName;
  final String description;
  final DateTime dateTime;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  @override
  State<ToDoCard> createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: widget.color)),
        width: double.infinity,
        height: 150,
        child: Stack(
          children: [
            // المحتوى الأساسي
            Row(
              children: [
                Container(
                  width: 12,
                  height: double.infinity,
                  color: widget.color,
                ),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 10, right: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Task Name : '),
                            Text(widget.taskName),
                          ],
                        ),

                        SizedBox(height: 10),

                        Row(
                          children: [
                            Text('Description : '),
                            Expanded(child: Text(widget.description)),
                          ],
                        ),

                        SizedBox(height: 10),

                        Row(
                          children: [
                            Text('Deadline : '),
                            Text(
                              '${widget.dateTime.day}/${widget.dateTime.month}/${widget.dateTime.year}',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // زر المينيو فوق الكل
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {
                  setState(() {
                    isPressed = !isPressed;
                  });
                },
                icon: Icon(Icons.menu, color: Colors.deepPurple),
              ),
            ),

            // القائمة (اختياري)
            if (isPressed)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 90,
                  height: 147.9,
                  color: Colors.deepPurple,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() => isPressed = false);
                            widget.onEdit();
                          },
                          child: Text(
                            "Edit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(height: 2, color: Colors.white),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () => setState(() {
                            isPressed = false;
                            widget.onDelete();
                          }),
                          child: Text(
                            "Delete",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
