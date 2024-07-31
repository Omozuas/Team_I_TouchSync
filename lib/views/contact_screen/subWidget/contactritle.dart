import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactTile extends StatelessWidget {
  const ContactTile(
      {super.key, required this.name, required this.email, this.onTap});
  final String name;
  final String email;
  final onTap;
  @override
  Widget build(BuildContext context) {
    List<Color> avatarBackgroundColor = [
      Color(0xffF7C5BF),
      Color(0xffFFF7B8),
      Color(0xffE3B8FF),
      Color(0xffFFBEB8),
      Color(0xffFFDBDE),
      Color(0xffFFDBB8),
      Color(0xffFFDBB8),
    ];
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: ListTile(
            visualDensity: VisualDensity(vertical: -4, horizontal: -4),
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: avatarBackgroundColor[Random().nextInt(7)],
              child: Icon(Icons.person),
            ),
            title: Text(
              name,
              style:
                  GoogleFonts.syne(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            subtitle: Text(
              email,
              style:
                  GoogleFonts.syne(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Gap(12),
      ],
    );
  }
}
