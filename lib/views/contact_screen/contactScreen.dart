import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:touchsync/services/database/providers/contactProvider.dart';
import 'package:touchsync/views/contact_screen/subWidget/contactritle.dart';
import 'package:touchsync/views/contact_screen/subWidget/deleteContact.dart';
import 'package:touchsync/widgets/textWidget.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<Contactprovider>(context, listen: false).fetchProfiles();
  }

  void _onSearchChanged() {
    Provider.of<Contactprovider>(context, listen: false)
        .fetchProfiles(filter: _searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final get = context.watch<Contactprovider>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Gap(24),
            buildTextField('Search contacts', Color(0xffFFFFFF),
                prefixIcon: Icons.search_outlined,
                suffixIcon: Icons.filter_list_outlined,
                controller: _searchController, onChange: (value) {
              _onSearchChanged();
            }),
            Gap(24),
            get.profiles.isEmpty
                ? Center(child: Text('No contacts available'))
                : ListView.builder(
                    itemCount: get.profiles.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = get.profiles[index];
                      return ContactTile(
                        name: '${item.surName}-${item.otherName}',
                        email: '${item.email}',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DeleteContactScreen(
                                        id: item.id,
                                      )));
                        },
                      );
                    }),
          ],
        ),
      ),
    );
  }
}
