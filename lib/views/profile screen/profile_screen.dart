import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:touchsync/services/database/providers/profileProvider.dart';
import 'package:touchsync/views/profile%20screen/subScreen/addNewLink.dart';
import 'package:touchsync/views/profile%20screen/subScreen/editprofile_screen.dart';
import 'package:touchsync/views/profile%20screen/subScreen/manage_tag_screen.dart';
import 'package:touchsync/widgets/reusableprofile_switch.dart';

import '../../widgets/reusable _arrow_buttons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _socialMediaLinksCount = 0;
  Map<String, bool> _socialMediaStatus = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserbyid();
    getSocialMediaLinksCount();
  }

  void getuserbyid() {
    Provider.of<Profileprovider>(context, listen: false).getDatabyId('user123');
  }

  void getSocialMediaLinksCount() async {
    var result = await Provider.of<Profileprovider>(context, listen: false)
        .getSocialMediaLinksByUserId('user123');
    setState(() {
      _socialMediaLinksCount = result['filledCount'] ?? 0;
      _socialMediaStatus = result['socialMediaStatus'] ?? {};
    });
  }

  @override
  Widget build(BuildContext context) {
    final get = context.watch<Profileprovider>();
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    'Profile',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        height: 0.8),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    height: 89,
                    width: 80,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                              'assets/images/profile_avatar.png'), // Replace with your asset path
                        ),
                        const SizedBox(height: 10),
                        Positioned(
                          right: 18,
                          bottom: -4,
                          child: Container(
                            height: 15,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                border:
                                    Border.all(color: const Color(0xff02D682))),
                            child: Center(
                              child: Text(
                                'Personal',
                                style: GoogleFonts.syne(
                                  fontSize: 10,
                                  height: 0.8,
                                  letterSpacing: 0.2,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    get.getbyId?.surName == null
                        ? ''
                        : '${get.getbyId!.surName} ${get.getbyId!.otherName}',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 0.8,
                      letterSpacing: 0.2,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfileScreen()));
                    },
                    child: const ReusableArrowButtons(
                      text: 'Edit Profile',
                      url: 'assets/images/arrow-left.png',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ManageTagScreen()));
                    },
                    child: const ReusableArrowButtons(
                      text: 'Manage Tags',
                      url: 'assets/images/arrow-left.png',
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // Handle Add New Link button press
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNewLinkScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 180,
                      decoration: BoxDecoration(
                        color: const Color(0xFF007198),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: const Icon(
                              Icons.link,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Add New Link',
                            style: GoogleFonts.syne(
                              fontSize: 14,
                              height: 0.8,
                              letterSpacing: -0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Links',
                          style: GoogleFonts.syne(
                            fontSize: 16,
                            height: 1,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        // this link is supposed to increse as the switch buttons are beign selected
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color:
                                    Color(0xff1A1F1D), // Color of the underline
                                width: 1.0, // Width of the underline
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              '($_socialMediaLinksCount Links)',
                              style: GoogleFonts.syne(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 0.8,
                                color: const Color(0xff1A1F1D),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ReusableProfileSwitch(
                      isToggled: _socialMediaStatus['tiktok'] ?? false,
                      text: 'Tiktok',
                      url: 'assets/images/tiktok.png'),
                  ReusableProfileSwitch(
                      isToggled: _socialMediaStatus['youtube'] ?? false,
                      text: 'Youtube',
                      url: 'assets/images/youtube.png'),
                  ReusableProfileSwitch(
                      isToggled: _socialMediaStatus['facebook'] ?? false,
                      text: 'Facebook',
                      url: 'assets/images/logos_facebook.png'),
                  ReusableProfileSwitch(
                      isToggled: _socialMediaStatus['messenger'] ?? false,
                      text: 'Messenger',
                      url: 'assets/images/_Social Icons.png'),
                  ReusableProfileSwitch(
                      isToggled: _socialMediaStatus['telegram'] ?? false,
                      text: 'Telegram',
                      url: 'assets/images/logos_telegram.png'),
                  ReusableProfileSwitch(
                      isToggled: _socialMediaStatus['instagram'] ?? false,
                      text: 'Instagram',
                      url: 'assets/images/skill-icons_instagram.png'),
                  ReusableProfileSwitch(
                      isToggled: _socialMediaStatus['whatsapp'] ?? false,
                      text: 'Whatsapp',
                      url: 'assets/images/logos_whatsapp-icon.png'),
                  ReusableProfileSwitch(
                      isToggled: _socialMediaStatus['paypal'] ?? false,
                      text: 'Paypal',
                      url: 'assets/images/paypal.png'),
                  ReusableProfileSwitch(
                      isToggled: _socialMediaStatus['zoom'] ?? false,
                      text: 'Zoom',
                      url: 'assets/images/akar-icons_zoom-fill.png'),
                  ReusableProfileSwitch(
                      isToggled: _socialMediaStatus['teams'] ?? false,
                      text: 'Teams',
                      url: 'assets/images/teams.png'),
                  ReusableProfileSwitch(
                      isToggled: _socialMediaStatus['notion'] ?? false,
                      text: 'Notion',
                      url: 'assets/images/notion.png'),
                  ReusableProfileSwitch(
                      isToggled: _socialMediaStatus['appStore'] ?? false,
                      text: 'App store',
                      url: 'assets/images/logos_apple-app-store.png'),
                ])));
  }
}
