import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:faker/faker.dart';
import 'package:thread/widget/home_screen/widget/profile_stack_box.dart';
import 'package:thread/widget/home_screen/widget/ellipsis_menu.dart';

class PostingScreen extends StatelessWidget {
  PostingScreen({super.key});

  final faker = Faker();
  final random = RandomGenerator();
  @override
  Widget build(BuildContext context) {
    final profileUrl =
        "https://picsum.photos/100/100?random=${random.integer(1000)}";
    final rightUrl =
        "https://picsum.photos/100/100?random=${random.integer(1000)}";
    final leftUrl =
        "https://picsum.photos/100/100?random=${random.integer(1000)}";
    final centerUrl =
        "https://picsum.photos/100/100?random=${random.integer(1000)}";

    final imageUrl1 =
        "https://picsum.photos/1000/1000?random=${random.integer(1000)}";
    final imageUrl2 =
        "https://picsum.photos/1000/1000?random=${random.integer(1000)}";

    void onEllipsisTap(BuildContext context) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (context) => Container(
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: EllipsisMenu(),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 40,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(profileUrl),
                ),
                StackBox(
                  rightUrl: rightUrl,
                  leftUrl: leftUrl,
                  centerUrl: centerUrl,
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      faker.person.name(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => onEllipsisTap(context),
                      child: FaIcon(FontAwesomeIcons.ellipsis),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  faker.lorem.sentence(),
                  style: TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 5),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Expanded(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(imageUrl1),
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: 350,
                          height: 200,
                        ),
                        SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(imageUrl2),
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: 350,
                          height: 200,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.heart),
                    SizedBox(width: 10),
                    FaIcon(FontAwesomeIcons.comment),
                    SizedBox(width: 10),
                    FaIcon(FontAwesomeIcons.repeat),
                    SizedBox(width: 10),
                    FaIcon(FontAwesomeIcons.paperPlane),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
