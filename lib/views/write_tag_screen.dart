import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:touchsync/services/nfc.Notifier/nfc_notifier.dart';
import 'package:touchsync/views/write_succesful_screen.dart';

import 'package:touchsync/widgets/custom_elevated_button.dart';
import 'package:touchsync/widgets/custom_textfield.dart';

class WritingTagScreen extends StatefulWidget {
  final String profileType;

  const WritingTagScreen({super.key, required this.profileType});

  @override
  State<WritingTagScreen> createState() => _WritingTagScreenState();
}

class _WritingTagScreenState extends State<WritingTagScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _urlController = TextEditingController();
  TextEditingController _jobTitleController = TextEditingController();
  TextEditingController _companyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final get1 = context.watch<NFCNotifier>();
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
                CustomTextField(
                  label: 'Name',
                  hintText: 'Enter name',
                  controller: _nameController,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Email',
                  hintText: 'Enter email',
                  controller: _emailController,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Phone Contact',
                  hintText: 'Enter phone contact',
                  controller: _phoneController,
                ),
                const SizedBox(height: 20),
                if (widget.profileType == 'Professional Profile') ...[
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: 'Job Title',
                    hintText: 'Enter job title',
                    controller: _jobTitleController,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: 'Company',
                    hintText: 'Enter company name',
                    controller: _companyController,
                  ),
                ],
                CustomTextField(
                  label: 'Social Media Links',
                  hintText: 'Enter social media links',
                  controller: _urlController,
                ),
                const SizedBox(height: 30),
                CustomElevatedButton(
                  text: get1.message.isEmpty ? 'Save' : get1.message,
                  onPressed: () {
                    get1.startNFCOperation(NFCOperation.write,
                        contactName: _nameController.text,
                        contactEmail: _emailController.text,
                        contactNumber: _phoneController.text,
                        contactUrl: _urlController.text,
                        contactJobTitle: _jobTitleController.text,
                        contactCompany: _companyController.text);
                    get1.message == 'DONE'
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WriteSuccesfulScreen(
                                      name: _nameController.text,
                                      phoneNumber: _phoneController.text,
                                      email: _emailController.text,
                                      company: _companyController.text,
                                      location: _urlController.text,
                                      jobTitle: _jobTitleController.text,
                                    )))
                        : Container();
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
