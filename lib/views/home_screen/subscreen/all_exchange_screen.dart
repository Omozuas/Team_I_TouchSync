import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchsync/widgets/all_exchange.dart';

class AllExchangeScreen extends StatefulWidget {
  const AllExchangeScreen({super.key});

  @override
  State<AllExchangeScreen> createState() => _AllExchangeScreenState();
}

class _AllExchangeScreenState extends State<AllExchangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
          Text('All Exchanges',
           style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.black,
                            height: 1.2,
                            fontWeight: FontWeight.w500),
                      ),
          Expanded(child: ContactHistoryList()),
        ],
      ));
  }
}