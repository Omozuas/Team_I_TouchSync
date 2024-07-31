import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableArrowButtons extends StatelessWidget {
  final String text;
  final String url;
   const ReusableArrowButtons({super.key, required this.text, required this.url,});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
                    Text(
                      text,
                      style: GoogleFonts.syne(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        height: 0.8,
                      ),
                    ),
                   ImageIcon(
                            AssetImage(
                              url
                            ),
                          ),
        ]
                  ),
    );
  }
}