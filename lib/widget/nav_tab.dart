import 'package:flutter/material.dart';
import 'package:thread/utils.dart';

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
          color: isDarkMode(context) ? Colors.black : Colors.white,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              icon,
              size: 24,
              color: isDarkMode(context)
                  ? isSelected
                        ? Colors.white
                        : Colors.grey[400]
                  : isSelected
                  ? Colors.black
                  : Colors.grey[400],
            ),
          ),
        ),
      ),
    );
  }
}
