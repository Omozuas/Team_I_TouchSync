import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildTextField(String hintText, Color color,
    {TextInputType? type = TextInputType.text,
    IconData? prefixIcon,
    IconData? suffixIcon,
    onChange,
    controller}) {
  return SizedBox(
    height: 48,
    child: TextField(
      keyboardType: type,
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, size: 20, color: Colors.grey)
            : null,
        filled: true,
        fillColor: color,
        hintText: hintText,
        hintStyle: GoogleFonts.syne(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xff8B8B8B)),
        suffixIcon: suffixIcon != null
            ? Icon(
                suffixIcon,
                size: 20,
                color: Colors.grey,
              )
            : null,
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
      ),
    ),
  );
}
