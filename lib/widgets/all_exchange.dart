import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ContactHistoryList extends StatelessWidget {
  final List<ContactHistory> histories = [
    ContactHistory('Shared contact with Judah', '28th July, 2024', '8:59am'),
    ContactHistory('Shared contact with Judah', '28th July, 2024', '8:59am'),
    ContactHistory('Shared contact with Judah', '28th July, 2024', '8:59am'),
    ContactHistory('Saved Michael John to contacts', '28th July, 2024', '10:05am'),
    ContactHistory('Saved Ify to contacts', '28th July, 2024', '12:50pm'),
    ContactHistory('Shared contact with Judah', '28th July, 2024', '8:59am'),
    ContactHistory('Shared contact with Judah', '28th July, 2024', '8:59am'),
    ContactHistory('Shared contact with Judah', '28th July, 2024', '8:59am'),
    ContactHistory('Saved Michael John to contacts', '28th July, 2024', '10:05am'),
    ContactHistory('Saved Ify to contacts', '28th July, 2024', '12:50pm'),
  ];
 ContactHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: histories.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.teal,
            child: Icon(Icons.sync, color: Colors.white),
          ),
          title: Text(histories[index].title),
          subtitle: Text(histories[index].subtitle),
          trailing: Text(histories[index].time),
        );
      },
    );
  }
}

class ContactHistory {
  final String title;
  final String subtitle;
  final String time;

  ContactHistory(this.title, this.subtitle, this.time);
}