import 'package:flutter/material.dart';
import 'package:thread/widget/home_screen/widget/menu_list_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EllipsisMenu extends StatefulWidget {
  const EllipsisMenu({super.key});

  @override
  State<EllipsisMenu> createState() => _EllipsisMenuState();
}

class _EllipsisMenuState extends State<EllipsisMenu> {
  void onReportTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => Container(
        height: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Report",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Why are you reporting this thread?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                    style: TextStyle(fontSize: 14),
                  ),
                  ReportListTile(text: "I just don't like it"),
                  ReportListTile(text: "It's unlawful content under NetzDG"),
                  ReportListTile(text: "It's spam"),
                  ReportListTile(text: "Hate speech or symbols"),
                  ReportListTile(text: "Nudity or sexual activity"),
                  ReportListTile(text: "False information"),
                  ReportListTile(text: "Harassment"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

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
              MenuListTile(
                text: "Report",
                color: Colors.red,
                onTap: () => onReportTap(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportListTile extends StatelessWidget {
  const ReportListTile({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(fontSize: 16)),
          FaIcon(FontAwesomeIcons.chevronRight),
        ],
      ),
    );
  }
}
