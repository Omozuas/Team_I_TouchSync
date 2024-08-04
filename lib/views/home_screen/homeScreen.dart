import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchsync/views/home_screen/subscreen/choosetag_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:touchsync/global-colors/colorsHex.dart';
import 'package:touchsync/services/database/providers/contactProvider.dart';
import 'package:touchsync/services/nfc.Notifier/nfc_notifier.dart';
import 'package:touchsync/views/home_screen/subscreen/read_tag_screen/exchange_contact_page.dart';

import 'package:touchsync/views/home_screen/subscreen/read_tag_screen/widget/action_botton.dart';
import 'package:touchsync/views/home_screen/subscreen/read_tag_screen/widget/sucees_Icon.dart';

import 'package:touchsync/views/profile%20screen/subScreen/settingsScreen/settings_screen.dart';
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

  void _showHalfScreenPopup(BuildContext context) {
    var get1 = Provider.of<NFCNotifier>(context, listen: false);

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final mediaQuery = MediaQuery.of(context);
        final screenHeight = mediaQuery.size.height;
        final screenWidth = mediaQuery.size.width;
        get1.startNFCOperation(NFCOperation.read);
        return Container(
          width: screenWidth,
          height: screenHeight / 2.3,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 10),
              Text('Ready to scan', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/Icon.png',
                height: screenHeight / 6,
                width: screenWidth / 4,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              Text('Hold your phone steady', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              ActionBtn(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                info: Text(get1.message.isEmpty ? "Cancel" : get1.message,
                    style: TextStyle(color: Colors.white)),
                func: () => get1.message == 'please Enable NFC From Setting'
                    ? Navigator.pop(context)
                    : {
                        Navigator.pop(context),
                        _showHalfScreenPopup2(context, get1.map)
                      },
                btnColor1: GlobalColors.blue,
                btnColor2: GlobalColors.blue,
              ),
            ],
          ),
        );
      },
      isScrollControlled: true,
    );
  }

  void _showHalfScreenPopup2(BuildContext context, map1) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final mediaQuery = MediaQuery.of(context);
        final screenHeight = mediaQuery.size.height;
        final screenWidth = mediaQuery.size.width;

        return Container(
          width: screenWidth,
          height: screenHeight / 3,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: screenWidth / 5,
                height: screenHeight / 5,
                decoration: BoxDecoration(
                  color: GlobalColors.transparentBlue,
                  shape: BoxShape.circle,
                ),
                child: SuccessIcon(),
              ),
              Text('Scan Successful'),
            ],
          ),
        );
      },
      isScrollControlled: true,
    );
    Future.delayed(Duration(seconds: 2), () {
      backk(map1);
    });
  }

  void backk(map1) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExchangePage(map: map1),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getrecentContacts();
    requestContactPermissions();
  }

  void getrecentContacts() {
    final get = Provider.of<Contactprovider>(context, listen: false);
    get.fetchRecentContacts(ascending: false, sortBy: 'time');
  }

  Future<bool> requestContactPermissions() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied || status.isPermanentlyDenied) {
      return await Permission.contacts.request().isGranted;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    final get = context.watch<Contactprovider>();

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
                                  builder: (context) =>
                                      const SettingsScreen()));
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
                            onTap: () {
                              _showHalfScreenPopup(context);
                            },
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child:
                  RowWithTwoTexts(text1: 'Recent Exchanges', text2: 'View all'),
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
                get.recentContacts.isEmpty
                    ? Center(child: Text('No contacts available'))
                    : ContactHistoryList(
                        get: get.recentContacts,
                      ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
