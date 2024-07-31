import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchsync/views/edit_tag_screen.dart';


class ManageTagScreen extends StatelessWidget {
  final List<String> tags = ['Tag 1', 'Tag 2', 'Tag 3', 'Tag 4', 'Tag 5', 'Tag 6', 'Tag 7'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFBFD),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_back, color: Color(0xff292D32)),
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
        child: ListView.builder(
          itemCount: tags.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFEFFAF5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tags[index],
                    style: GoogleFonts.syne(
                      fontSize: 16,
                      height: 0.8,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff191919,
                      
)
                    ),
                  ),
                  Row(
                    children: [
                     GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditTagScreen()));
                      },
                       child: const ImageIcon(
                            AssetImage(
                              'assets/images/edit-2.png',
                            ),
                            color: Color(0xff007198),
                          ),
                     ),
                     const SizedBox(width: 10,),
                     GestureDetector(
                      onTap: () {},
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
}
