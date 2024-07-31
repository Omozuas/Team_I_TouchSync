import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchsync/views/tagsaved_successful.dart';
import 'package:touchsync/widgets/custom_elevated_button.dart';

class EditTagScreen extends StatefulWidget {
  @override
  _EditTagScreenState createState() => _EditTagScreenState();
}

class _EditTagScreenState extends State<EditTagScreen> {
  final TextEditingController _nameController = TextEditingController(text: 'Ofofon Emmanuel');
  final TextEditingController _emailController = TextEditingController(text: 'ofofon.emmanuel@gmail.com');
  final TextEditingController _phoneController = TextEditingController(text: '09012345678');
  final TextEditingController _socialMediaController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _socialMediaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFBFD),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_back, color: Color(0xff292D32)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Tag',
          style: GoogleFonts.syne(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                label: 'Name',
                controller: _nameController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Email',
                controller: _emailController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Phone Contact',
                controller: _phoneController,
              ),
              const SizedBox(height: 16),
              Text(
                'Social Media Links',
                style: GoogleFonts.syne(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  Chip(
                    label: Text('Facebook'),
                    backgroundColor: Color(0xFFEFFAF5),
                  ),
                  Chip(
                    label: Text('Instagram'),
                    backgroundColor: Color(0xFFEFFAF5),
                  ),
                ],
              ),
             const SizedBox(height: 30,),
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomElevatedButton(
                text: 'Save',
                //function to add more tags
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const TagsavedSuccessful()));
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomElevatedButton(
                  text: 'Cancel',
                  backgroundColor: Colors.white,
                  textColor: const Color(0xff007192),
                  borderColor: const Color(0xff007192), onPressed: () { Navigator.pop(context); },
                  
              
              ),
        )
          
        ]),
      ),
     ) );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.syne(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xff9CA3AF),
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xffE5E7EB)),
            ),
          ),
          style: GoogleFonts.syne(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
