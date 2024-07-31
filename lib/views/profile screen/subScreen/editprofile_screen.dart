import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:touchsync/services/database/providers/profileProvider.dart';
import 'package:touchsync/services/database/schemas/profie.schema.dart';
import 'package:touchsync/views/profile%20screen/subScreen/editProfileScreefeedBack.dart';
import 'package:touchsync/widgets/textWidget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _otherNameController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getprofile();
  }

  void getprofile() {
    Provider.of<Profileprovider>(context, listen: false).getDatabyId('user123');
  }

  void update() {
    final tag = ProfileSchema(
        id: 'user123',
        surName: _nameController.text,
        email: _emailController.text,
        location: _locationController.text,
        phoneNumber: _phoneController.text,
        otherName: _otherNameController.text);
    final get = Provider.of<Profileprovider>(context, listen: false);
    get.updateItem(tag);
  }

  @override
  Widget build(BuildContext context) {
    final get = context.watch<Profileprovider>();
    if (get.getbyId != null) {
      _emailController.text = get.getbyId!.email ?? '';
      _phoneController.text = get.getbyId!.phoneNumber ?? '';
      _nameController.text = get.getbyId!.surName ?? '';
      _locationController.text = get.getbyId!.location ?? '';
      _otherNameController.text = get.getbyId!.otherName ?? '';
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.chevron_left_rounded),
        ),
        title: Text(
          'Edit Profile',
          style: GoogleFonts.syne(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: Color(0xff191919)),
        ),
      ),
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SurName',
              style: GoogleFonts.syne(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            buildTextField('${get.getbyId!.surName}', Color(0xffFFFFFF),
                controller: _nameController),
            Gap(16),
            Text(
              'OtherName',
              style: GoogleFonts.syne(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            buildTextField('${get.getbyId!.otherName}', Color(0xffFFFFFF),
                controller: _otherNameController),
            Gap(16),
            Text(
              'Email',
              style: GoogleFonts.syne(
                  color: Color(0xff565050),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            buildTextField('${get.getbyId?.email}', Color(0xffFFFFFF),
                controller: _emailController, type: TextInputType.emailAddress),
            Gap(16),
            Text(
              'Phone number',
              style: GoogleFonts.syne(
                  color: Color(0xff565050),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            buildTextField('${get.getbyId?.phoneNumber}', Color(0xffFFFFFF),
                controller: _phoneController, type: TextInputType.phone),
            Gap(16),
            Text(
              'Location',
              style: GoogleFonts.syne(
                  color: Color(0xff565050),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            buildTextField('${get.getbyId?.location}', Color(0xffFFFFFF),
                controller: _locationController,
                type: TextInputType.streetAddress),
            Gap(70),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0xff007198)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                  ),
                  onPressed: () {
                    update();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfileFeedbackScreen()));
                  },
                  child: Text(
                    get.loading ? 'Saving...' : 'save',
                    style: GoogleFonts.syne(
                        color: const Color(0xffFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
