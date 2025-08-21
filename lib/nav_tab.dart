import 'package:flutter/material.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.icon,
    this.isSelected = false,
    required this.onTap,
  });

  final IconData icon;
  final bool isSelected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: Colors.white,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              icon,
              size: 24,
              color: isSelected ? Colors.black : Colors.grey[400],
            ),
          ),
        ),
      ),
    );
  }
}
