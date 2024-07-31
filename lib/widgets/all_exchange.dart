import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactHistoryList extends StatelessWidget {
  ContactHistoryList({super.key, required this.get});
  final get;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: get.length,
      itemBuilder: (context, index) {
        final contact = get[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.teal,
            child: Icon(Icons.sync, color: Colors.white),
          ),
          title: Text('${contact.texts}'),
          subtitle: Text(contact.day),
          trailing: Text(contact.time),
        );
      },
    );
  }
}
