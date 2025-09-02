import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:faker/faker.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final faker = Faker();
  final random = RandomGenerator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Search',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28),
              ),
            ],
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(placeholder: 'Search'),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://picsum.photos/100/100?random=${random.integer(100)}',
                              ),
                            ),
                            title: Text(
                              faker.person.name(),
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(faker.person.firstName()),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Follow',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://picsum.photos/100/100?random=${random.integer(100)}',
                              ),
                            ),
                            title: Text(
                              faker.person.name(),
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(faker.person.firstName()),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Follow',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://picsum.photos/100/100?random=${random.integer(100)}',
                              ),
                            ),
                            title: Text(
                              faker.person.name(),
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(faker.person.firstName()),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Follow',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
