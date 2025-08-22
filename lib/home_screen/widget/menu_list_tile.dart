import 'package:flutter/material.dart';

class MenuListTile extends StatelessWidget {
  const MenuListTile({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.onTap,
  });

  final String text;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
