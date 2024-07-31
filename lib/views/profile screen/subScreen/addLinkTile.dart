import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:touchsync/services/database/providers/profileProvider.dart';
import 'package:touchsync/views/profile%20screen/subScreen/linkFeedbackScreen.dart';
import 'package:touchsync/widgets/textWidget.dart';

class AddLinkTile extends StatefulWidget {
  const AddLinkTile({
    super.key,
    required this.image,
    required this.handle,
  });
  final String image;
  final String handle;

  @override
  State<AddLinkTile> createState() => _AddLinkTileState();
}

class _AddLinkTileState extends State<AddLinkTile> {
  TextEditingController _textController = TextEditingController();
  void displayBottomSheet(BuildContext context, String handle, String image) {
    showModalBottomSheet(
        isScrollControlled: true,
        scrollControlDisabledMaxHeightRatio: 2,
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 17.75),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(36),
                  Center(
                    child: Image(
                      image: AssetImage(image),
                    ),
                  ),
                  Gap(12),
                  Center(
                      child: Text(
                    handle,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  )),
                  Gap(24),
                  Text(
                    'Link title',
                    style: GoogleFonts.syne(
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  Gap(8),
                  buildTextContainer(handle),
                  Gap(16),
                  Text(
                    'Profile Link',
                    style: GoogleFonts.syne(
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  Gap(8),
                  buildTextField(
                      'www.instagram/williams.com', Color(0xffFFFFFF),
                      controller: _textController, type: TextInputType.url),
                  Gap(34),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff007198))),
                        onPressed: () {
                          getuserbyid1();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LinkFeedbackScreen()));
                        },
                        child: Text(
                          'Add',
                          style: GoogleFonts.poppins(
                              color: Color(0xffFFFFFF),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  Gap(36),
                ],
              ),
            ),
          );
        });
  }

  void getuserbyid1() {
    final get = Provider.of<Profileprovider>(context, listen: false);
    get.updateProfileField(
        'user123', widget.handle.toLowerCase(), _textController.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59,
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          color: Color(0xffECF9F4), borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image(
          image: AssetImage(widget.image),
          width: 30,
          height: 30,
        ),
        title: Text(
          widget.handle,
          style: GoogleFonts.syne(fontWeight: FontWeight.w400, fontSize: 14),
        ),
        trailing: SizedBox(
          width: 46,
          child: GestureDetector(
            onTap: () =>
                displayBottomSheet(context, widget.handle, widget.image),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.add, size: 11),
                Text(
                  'Add',
                  style: GoogleFonts.syne(
                      fontSize: 14, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildTextContainer(
  String text,
) {
  return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade100, width: 1)),
      height: 48,
      width: double.infinity,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: GoogleFonts.syne(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xff8B8B8B)),
        ),
      ));
}
