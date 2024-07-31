import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchsync/views/profile%20screen/subScreen/addLinkTile.dart';

class BusinessLinksTab extends StatelessWidget {
  const BusinessLinksTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(24),
          Text('Business Links',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 18)),
          Gap(16),
          AddLinkTile(
            image: 'assets/images/paypal.png',
            handle: 'Paypal',
          ),
          AddLinkTile(
            image: 'assets/images/zoom.png',
            handle: 'ZoomMeeting',
          ),
          AddLinkTile(
            image: 'assets/images/teams.png',
            handle: 'Teams',
          ),
          AddLinkTile(
            image: 'assets/images/notion.png',
            handle: 'Notion',
          ),
          AddLinkTile(
            image: 'assets/images/appstore.png',
            handle: 'App Store',
          ),
        ],
      ),
    );
  }
}
