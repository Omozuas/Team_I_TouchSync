import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:touchsync/controller/bottomNavController/bottomNav_controller.dart';
import 'package:touchsync/routers/bottomNavRoute/bottomNav_Route.dart';
import 'package:touchsync/services/database/providers/contactProvider.dart';
import 'package:touchsync/widgets/textWidget.dart';

class DeleteContactScreen extends StatefulWidget {
  const DeleteContactScreen({super.key, this.id});
  final id;

  @override
  State<DeleteContactScreen> createState() => _DeleteContactScreenState();
}

class _DeleteContactScreenState extends State<DeleteContactScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _urlController = TextEditingController();
  TextEditingController _showWorkingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<Contactprovider>(context, listen: false).getDatabyId(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final get = context.watch<Contactprovider>();
    if (get.contact != null) {
      _emailController.text = get.contact!.email ?? '';
      _phoneController.text = get.contact!.phoneNumber ?? '';
      _urlController.text = get.contact!.zoomMeeting ?? '';
      _showWorkingController.text = get.contact!.location ?? '';
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffFFFFFF),
        surfaceTintColor: Colors.transparent,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_circle_left_outlined,
                  color: Color(0xff292D32)),
            ),
            const Gap(12),
            Text(
              'Go back',
              style:
                  GoogleFonts.syne(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xffFFFFFF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(30),
            const Center(
              child: CircleAvatar(
                backgroundColor: Color(0xffFFBEB8),
                radius: 40,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ),
            const Gap(16),
            Text('${get.contact?.surName} ${get.contact?.otherName}',
                style: GoogleFonts.syne(
                    fontSize: 24, fontWeight: FontWeight.w400)),
            const Gap(16),
            Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: GoogleFonts.syne(
                          color: const Color(0xff565050),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    buildTextField(
                        '${get.contact?.email}', const Color(0xffFFFFFF),
                        type: TextInputType.emailAddress,
                        controller: _emailController),
                    const Gap(16),
                    Text(
                      'Phone Contact',
                      style: GoogleFonts.syne(
                          color: const Color(0xff565050),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    buildTextField(
                        '${get.contact?.phoneNumber}', const Color(0xffFFFFFF),
                        type: TextInputType.phone,
                        controller: _phoneController),
                    const Gap(16),
                    Text(
                      'Website Link',
                      style: GoogleFonts.syne(
                          color: const Color(0xff565050),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    buildTextField(
                        '${get.contact?.zoomMeeting}', const Color(0xffFFFFFF),
                        type: TextInputType.url, controller: _urlController),
                    const Gap(16),
                    Text(
                      'Notes',
                      style: GoogleFonts.syne(
                          color: const Color(0xff565050),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    buildTextField('Show workings', const Color(0xffFFFFFF),
                        type: TextInputType.text,
                        controller: _showWorkingController),
                    const Gap(16),
                  ],
                )),
            const Gap(40),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0xffC13232)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                  ),
                  onPressed: () {
                    // CoolAlert.show(
                    //   backgroundColor: Color(0xffFFFFFF),
                    //   context: context,
                    //   type: CoolAlertType.confirm,
                    //   title: 'Delete Contact',
                    //   text:
                    //       'Once this contact is deleted, you will loose all information regarding this contact permanently. Do you wish to continue?',
                    //   confirmBtnText: 'No, Cancel',
                    //   cancelBtnText: 'Yes, Delete',
                    //   onCancelBtnTap: () {
                    //     Navigator.pop(context);
                    //     CoolAlert.show(
                    //         context: context,
                    //         type: CoolAlertType.info,
                    //         title: 'Contact Deleted',
                    //         text:
                    //             'This contact has been permanently deleted  from your contacts');
                    //   },
                    //   confirmBtnColor: Colors.transparent,
                    //   confirmBtnTextStyle: GoogleFonts.syne(
                    //       color: Color(0xff007198),
                    //       fontWeight: FontWeight.w400,
                    //       fontSize: 16),
                    //   cancelBtnTextStyle: GoogleFonts.syne(
                    //       color: Color(0xffFF3145),
                    //       fontWeight: FontWeight.w400,
                    //       fontSize: 16),
                    // );
                    _showDeleteDialog(context, get.contact!.id);
                  },
                  child: Text(
                    'Delete Contact',
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

void _showDeleteDialog(BuildContext context, id) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final get = context.watch<Contactprovider>();
      return AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        title: Center(
          child: Text(
            'Delete Contact',
            style: GoogleFonts.syne(fontWeight: FontWeight.w500, fontSize: 24),
          ),
        ),
        content: Text(
          'Once this contact is deleted, you will lose all information regarding this contact permanently. Do you wish to continue?',
          textAlign: TextAlign.center,
          style: GoogleFonts.syne(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        actionsAlignment: MainAxisAlignment.end,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              get.deleteItem(id);
              _showDeleteConfirmation(context);
            },
            child: Text(
              'Yes, Delete',
              style: GoogleFonts.syne(
                  color: const Color(0xffFF3145),
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'No, Cancel',
              style: GoogleFonts.syne(
                  color: const Color(0xff007198),
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ),
        ],
      );
    },
  );
}

void _showDeleteConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: const EdgeInsets.all(20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              backgroundColor: Color(0xff007198),
              radius: 30,
              child: Icon(
                Icons.check,
                color: Color(0xffFFFFFF),
                size: 40,
              ),
            ),
            const Gap(16),
            Text(
              'Contact Deleted',
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.syne(fontWeight: FontWeight.w500, fontSize: 24),
            ),
            const Gap(8),
            Text(
              'This contact has been permanently deleted from your contacts.',
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.syne(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );
    },
  );
}
