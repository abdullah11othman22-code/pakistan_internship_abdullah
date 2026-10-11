import 'package:flutter/material.dart';
import 'package:project1/shared/core/constant.dart';

import '../../shared/widgets/Wedgets/week_card.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text('Weeks', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 14, horizontal: 14),
        child: GridView.builder(
          itemCount: weeks.length,
          itemBuilder: (BuildContext context, int index) {
            return MainCard(onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return weeks[index].screen!;
                  },
                ),
              );

            },
              title: weeks[index].title,

            );
          },
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
          ),
        ),
      ),
    );
  }
}
