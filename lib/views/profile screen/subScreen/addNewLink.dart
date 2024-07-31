import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchsync/views/profile%20screen/subScreen/businessTab.dart';
import 'package:touchsync/views/profile%20screen/subScreen/socialWorkTab.dart';

class AddNewLinkScreen extends StatefulWidget {
  const AddNewLinkScreen({super.key});
  @override
  State<AddNewLinkScreen> createState() => _AddNewLinkScreenState();
}

class _AddNewLinkScreenState extends State<AddNewLinkScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.chevron_left_rounded),
        ),
        title: Text(
          'Add New Link',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        bottom: TabBar(
          padding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 18),
          indicatorSize: TabBarIndicatorSize.tab,
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
          indicator: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff007198),
          ),
          dividerColor: Colors.transparent,
          controller: _tabController,
          labelStyle: GoogleFonts.syne(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xffFFFFFF)),
          unselectedLabelStyle: GoogleFonts.syne(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xff6B6B6B)),
          tabs: [
            Tab(text: 'Social Networks'),
            Tab(text: 'Business Links'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: TabBarView(controller: _tabController, children: [
          SocialNetworksTab(),
          BusinessLinksTab(),
        ]),
      ),
    );
  }
}
