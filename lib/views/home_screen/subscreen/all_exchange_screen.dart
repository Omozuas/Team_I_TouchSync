import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:touchsync/services/database/providers/contactProvider.dart';
import 'package:touchsync/widgets/all_exchange.dart';

class AllExchangeScreen extends StatefulWidget {
  const AllExchangeScreen({super.key});

  @override
  State<AllExchangeScreen> createState() => _AllExchangeScreenState();
}

class _AllExchangeScreenState extends State<AllExchangeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getrecentContacts();
    print('object');
  }

  void getrecentContacts() {
    final get = Provider.of<Contactprovider>(context, listen: false);
    get.fetchRecentContacts24(sortBy: 'time', ascending: false);
  }

  @override
  Widget build(BuildContext context) {
    final get = context.watch<Contactprovider>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'All Exchanges',
            style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.black,
                height: 1.2,
                fontWeight: FontWeight.w500),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                CupertinoIcons.arrow_left_circle,
                size: 24,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ContactHistoryList(
                get: get.profiles,
              ),
            ],
          ),
        ));
  }
}
