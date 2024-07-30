import 'package:flutter/material.dart';

class ReadPageForm extends StatelessWidget {
  final String hintText;

  ReadPageForm({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}
