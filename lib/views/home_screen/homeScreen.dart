import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchsync/views/home_screen/subscreen/choosetag_screen.dart';

import 'package:touchsync/views/home_screen/subscreen/scan_tag_screen.dart';
import 'package:touchsync/views/settings/settings_screen.dart';
import 'package:touchsync/widgets/all_exchange.dart';
import 'package:touchsync/widgets/home_screen_row_text.dart';
import 'package:touchsync/widgets/nfc_tag_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedButton = '';

  void _onButtonTap(String button, Widget screen) {
    setState(() {
      _selectedButton = button;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: screenHeight * 0.19,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Welcome\nTeam TouchSync',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.black,
                            height: 1.2,
                            fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettingsScreen()));
                        },
                        child: const ImageIcon(
                          AssetImage(
                            'assets/images/setting-2.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'What would you like to do today?',
                      style: GoogleFonts.syne(
                          fontSize: 16,
                          color: const Color(
                            0xff9CA3AF,
                          ),
                          height: 1.2,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NfcTagButtons(
                            text: 'Write NFC Tag',
                            url: 'assets/images/edit-2.png',
                            isSelected: _selectedButton == 'Write NFC Tag',
                            onTap: () => _onButtonTap(
                                'Write NFC Tag', ChooseTagProfileScreen()),
                          ),
                          NfcTagButtons(
                            text: 'Scan NFC Tag',
                            url: 'assets/images/scanner.png',
                            isSelected: _selectedButton == 'Scan NFC Tag',
                            onTap: () => _onButtonTap(
                                'Scan NFC Tag', const ScanningTagScreen()),
                          ),
                        ]),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: RowWithTwoTexts(text1: 'Recent Exchanges', text2: 'View all'),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                ContactHistoryList(),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
