import 'package:flutter/material.dart';

class EllipsisMenu extends StatefulWidget {
  const EllipsisMenu({super.key});

  @override
  State<EllipsisMenu> createState() => _EllipsisMenuState();
}

class _EllipsisMenuState extends State<EllipsisMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuListTile(text: "Unfollow"),
              MenuListTile(text: "Mute"),
              MenuListTile(text: "Hide"),
              MenuListTile(text: "Report", color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuListTile extends StatelessWidget {
  const MenuListTile({
    super.key,
    required this.text,
    this.color = Colors.black,
  });

  final String text;
  final Color color;

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
      onTap: () {},
    );
  }
}
