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
        margin: EdgeInsetsGeometry.symmetric(horizontal: 16,vertical: 12),
        height: 125,
        width: 125,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)),
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
