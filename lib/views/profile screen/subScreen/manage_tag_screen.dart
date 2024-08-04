import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:touchsync/services/database/providers/contactProvider.dart';
import 'package:touchsync/services/database/providers/tagProvider.dart';
import 'package:touchsync/views/profile%20screen/subScreen/settingsScreen/edit_tag_screen.dart';
import 'package:touchsync/views/profile%20screen/subScreen/deletfeedbackScreen.dart';

class ManageTagScreen extends StatefulWidget {
  @override
  State<ManageTagScreen> createState() => _ManageTagScreenState();
}

class _ManageTagScreenState extends State<ManageTagScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Tagprovider>(context, listen: false).fetchProfiles();
  }

  @override
  Widget build(BuildContext context) {
    final get = context.watch<Tagprovider>();
    return Scaffold(
      backgroundColor: const Color(0xFFFEFBFD),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon:
              const Icon(CupertinoIcons.chevron_back, color: Color(0xff292D32)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Manage Tag',
          style: GoogleFonts.syne(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: get.profiles.isEmpty
            ? Center(child: Text('No Tags available'))
            : ListView.builder(
                itemCount: get.profiles.length,
                itemBuilder: (context, index) {
                  final tagss = get.profiles[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFFAF5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tag ${get.profiles.length + index - 1}',
                          style: GoogleFonts.syne(
                              fontSize: 16,
                              height: 0.8,
                              fontWeight: FontWeight.w400,
                              color: Color(
                                0xff191919,
                              )),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditTagScreen(id: tagss.id)));
                              },
                              child: const ImageIcon(
                                AssetImage(
                                  'assets/images/edit-2.png',
                                ),
                                color: Color(0xff007198),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                _showDeleteDialog(context, tagss.id);
                              },
                              child: const ImageIcon(
                                AssetImage(
                                  'assets/images/trash.png',
                                ),
                                color: Color(0xffFF3145),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: Center(
            child: Text(
              'Delete Tag',
              style:
                  GoogleFonts.syne(fontWeight: FontWeight.w500, fontSize: 24),
            ),
          ),
          content: Text(
            'Are you sure you want to delete this tag?',
            textAlign: TextAlign.center,
            style: GoogleFonts.syne(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          actionsAlignment: MainAxisAlignment.end,
          actions: [
            TextButton(
              onPressed: () {
                Provider.of<Tagprovider>(context, listen: false).deleteItem(id);
                Provider.of<Tagprovider>(context, listen: false)
                    .fetchProfiles();
                setState(() {});
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeleteFeedbackScreen()));
              },
              child: Text(
                'Yes, Delete',
                style: GoogleFonts.syne(
                    color: const Color(0xffFF3145),
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'No, Cancel',
                style: GoogleFonts.syne(
                    color: const Color(0xff007198),
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }
}
