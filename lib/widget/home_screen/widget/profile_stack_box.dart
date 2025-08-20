import 'package:flutter/material.dart';

class StackBox extends StatelessWidget {
  const StackBox({
    super.key,
    required this.rightUrl,
    required this.leftUrl,
    required this.centerUrl,
  });

  final String rightUrl;
  final String leftUrl;
  final String centerUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 1,
            child: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(rightUrl),
            ),
          ),
          Positioned(
            left: 1,
            bottom: 0.1,
            child: CircleAvatar(
              radius: 10,
              backgroundImage: NetworkImage(leftUrl),
            ),
          ),
          Positioned(
            bottom: 0.1,
            right: 1,
            child: CircleAvatar(
              radius: 8,
              backgroundImage: NetworkImage(centerUrl),
            ),
          ),
        ],
      ),
    );
  }
}
