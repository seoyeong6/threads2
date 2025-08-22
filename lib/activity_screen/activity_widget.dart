import 'package:flutter/material.dart';

import 'package:faker/faker.dart';

class ActivityWidget extends StatelessWidget {
  ActivityWidget({
    super.key,
    required this.optionText,
    required this.timeText,
    required this.name,
  });

  final faker = Faker();
  final random = RandomGenerator();
  final String optionText;
  final String timeText;
  final String name;

  @override
  Widget build(BuildContext context) {
    final profileUrl =
        "https://picsum.photos/100/100?random=${random.integer(100)}";

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(radius: 20, backgroundImage: NetworkImage(profileUrl)),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 10),
                    Text(
                      timeText,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                Text(
                  optionText,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
                ),
                SizedBox(height: 5),
                Text(
                  faker.lorem.sentence(),
                  style: TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
