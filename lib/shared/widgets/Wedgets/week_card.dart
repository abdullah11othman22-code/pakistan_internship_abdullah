import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final Function()? onTap;
  final String title;

  const MainCard({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple,
              blurRadius: 3,
              spreadRadius: 2,
              offset: Offset(-1,0),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
