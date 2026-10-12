import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onTap,
    this.color = Colors.deepPurple,
    this.h=300,
    this.w=50,
    this.rad=10, required this.title,

  });

  final String title;
  final double h;
  final double rad;
  final double w;
  final VoidCallback onTap;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onTap,
      style: ElevatedButton.styleFrom(
        minimumSize:  Size(h, w),
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(rad),
        ),
      ),
      child: Text(title),
    );
  }
}
