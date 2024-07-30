import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchsync/views/write_succesful_screen.dart';
import 'package:touchsync/widgets/custom_elevated_button.dart';
import 'package:touchsync/widgets/custom_textfield.dart';

class WritingTagScreen extends StatefulWidget {
  const WritingTagScreen({super.key});

  @override
  State<WritingTagScreen> createState() => _WritingTagScreenState();
}

class _WritingTagScreenState extends State<WritingTagScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      const ImageIcon(
                        AssetImage(
                          'assets/images/arrow-circle-left.png',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Go back',
                        style: GoogleFonts.syne(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text('Write NFC Tag',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.black,
                        height: 1.2,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 10),
                Text(
                  'Enter the details you would like to write to the tag',
                  style: GoogleFonts.syne(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff9CA3AF),
                    height: 1.71,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(label: 'Name', hintText: 'Enter name'),
                const SizedBox(height: 20),
                CustomTextField(label: 'Email', hintText: 'Enter email'),
                const SizedBox(height: 20),
                CustomTextField(
                    label: 'Phone Contact', hintText: 'Enter phone contact'),
                const SizedBox(height: 20),
                CustomTextField(
                    label: 'Social Media Links',
                    hintText: 'Enter social media links'),
                const SizedBox(height: 30),
                CustomElevatedButton(
                  text: 'Save',
                  onPressed: () {
                    // Add your onPressed functionality here TO save the details and upon completion, it should navigate to the succesful screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WriteSuccesfulScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
