import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project1/screens/week2/week_2_task_1/widgets/dialog.dart';
import 'package:project1/screens/week2/week_2_task_1/widgets/widget_shopping_card.dart';

import '../../../shared/widgets/custom_app_bar.dart';

class SimpleShoppingListScreen extends StatefulWidget {
  const SimpleShoppingListScreen({super.key});

  @override
  State<SimpleShoppingListScreen> createState() =>
      _SimpleShoppingListScreenState();
}

class _SimpleShoppingListScreenState extends State<SimpleShoppingListScreen> {
  List<Widget> item = List.generate(15, (index) => WidgetShoppingCard());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Padding(
        padding: EdgeInsetsGeometry.all(12),
        child: GestureDetector(
          onTap: () async {
            final result = await showDialog(
              context: context,
              builder: (_) => addItemDialog(),
            );
          },
          child: CircleAvatar(
            child: const Icon(Icons.add),
            backgroundColor: Colors.deepPurple.shade100,
            radius: 28,
          ),
        ),
      ),
      appBar: CustomAppbar(title: 'Task-1-'),
      body: Column(
        children: [
          SizedBox(height: 16),
          Text(
            'Simple Shopping List App',
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 16),
          Expanded(

            child: ListView.separated(
              itemBuilder: (context, index) {
                return
                  Slidable(
                    key: ValueKey(index),
                    endActionPane: ActionPane(
                      motion: const StretchMotion(),

                      extentRatio: 0.2, // 👈 هون بتحدد المسافة المطلوبة (30%)

                      dismissible: DismissiblePane(confirmDismiss: () async{
                        final result = await showDialog(
                          context: context,
                          builder: (_) => addItemDialog(),
                        );

                        if (result == true) {
                          setState(() {
                            item.removeAt(index);
                          });return true;

                        } else {
                          Slidable.of(context)?.close();
                          return false;
                        }
                      },
                        onDismissed: () async {
                          final result = await showDialog(
                            context: context,
                            builder: (_) => addItemDialog(),
                          );

                          if (result == true) {
                            // setState(() {
                            //   item.removeAt(index);
                            // });
                          } else {
                            Slidable.of(context)?.close();
                          }
                        },
                      ),

                      children: [
                        SlidableAction(
                          onPressed: (_) {},
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                        ),
                      ],
                    ),
                    child: item[index],
                  );              },
              separatorBuilder: (_, __) {
                return SizedBox(height: 12,);
              },
              itemCount: item.length,
            ),
          ),
        ],
      ),
    );
  }
}
