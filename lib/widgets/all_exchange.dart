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
           // radius: 50,
            backgroundColor: Colors.teal,
            child: ImageIcon(
                        AssetImage(
                          'assets/images/export.png',
                        ),
                      ),
          ),
          title: Text('${contact.texts}'),
          subtitle: Text(contact.day),
          trailing: Text(contact.time),
        );
      },
    );
  }
}
