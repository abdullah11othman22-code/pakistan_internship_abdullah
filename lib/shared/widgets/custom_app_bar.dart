import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}