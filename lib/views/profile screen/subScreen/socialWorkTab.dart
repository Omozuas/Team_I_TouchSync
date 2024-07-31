import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchsync/views/profile%20screen/subScreen/addLinkTile.dart';

class SocialNetworksTab extends StatelessWidget {
  const SocialNetworksTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(24),
          Text('Social Networks',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 18)),
          Gap(16),
          AddLinkTile(
            image: 'assets/images/messenger.png',
            handle: 'Messenger',
          ),
          AddLinkTile(
            image: 'assets/images/tiktok.png',
            handle: 'TikTok',
          ),
          AddLinkTile(
            image: 'assets/images/telegram.png',
            handle: 'Telegram',
          ),
          AddLinkTile(
            image: 'assets/images/instagram.png',
            handle: 'Instagram',
          ),
          AddLinkTile(
            image: 'assets/images/whatsapp.png',
            handle: 'Whatsapp',
          ),
          AddLinkTile(
            image: 'assets/images/facebook.png',
            handle: 'Facebook',
          ),
          AddLinkTile(
            image: 'assets/images/youtube.png',
            handle: 'Youtube',
          ),
        ],
      ),
    );
  }
}
