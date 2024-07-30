import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NfcTagButtons extends StatelessWidget {
  final String text;
  final String url;
  final bool isSelected;
  final VoidCallback onTap;

  NfcTagButtons({
    required this.text,
    required this.url,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: screenHeight * 0.042,
        width: screenWidth * 0.40,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF007198) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF007198),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.syne(
                fontSize: 16,
                color: isSelected ? Colors.white : const Color(0xff1B1C1D),
                height: 1.37,
                letterSpacing: -0.41,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 5),
            ImageIcon(
              AssetImage(url),
              color: isSelected ? Colors.white : const Color(0xff1B1C1D),
            ),
          ],
        ),
      ),
    );
  }
}
