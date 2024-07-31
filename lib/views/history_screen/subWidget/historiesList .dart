import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:touchsync/controller/bottomNavController/bottomNav_controller.dart';
import 'package:touchsync/routers/bottomNavRoute/bottomNav_Route.dart';
import 'package:touchsync/services/database/providers/contactProvider.dart';
import 'package:touchsync/widgets/textWidget.dart';

class HistoriesList extends StatelessWidget {
  const HistoriesList({super.key, this.get});
  final get;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemExtent: 70,
        physics: NeverScrollableScrollPhysics(),
        itemCount: get.length,
        itemBuilder: (context, index) {
          final contact = get[index];
          return HistoryTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                            id: contact.id,
                          )));
            },
            image: 'assets/images/import.png',
            color: Color(0xff004B65),
            time: '${contact.time}',
            title: '${contact.texts}',
            date: '${contact.day}',
          );
        });
  }
}

class HistoryTile extends StatelessWidget {
  const HistoryTile(
      {super.key,
      required this.image,
      required this.color,
      required this.time,
      required this.title,
      required this.date,
      required this.onTap});
  final String image;
  final String time;
  final String title;
  final String date;
  final Color color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: ListTile(
            visualDensity: VisualDensity(vertical: -4, horizontal: -4),
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: color,
              child: Image(image: AssetImage(image)),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.syne(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Text(
                  time,
                  style: GoogleFonts.syne(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            subtitle: Text(
              date,
              style: GoogleFonts.syne(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff9CA3AF)),
            ),
          ),
        ),
      ],
    );
  }
}

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, this.id});
  final id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<Contactprovider>(context, listen: false).getDatabyId(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavigationController());
    final get = context.watch<Contactprovider>();
    if (get.contact != null) {
      _emailController.text = get.contact!.email ?? '';
      _phoneController.text = get.contact!.phoneNumber ?? '';
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffFFFFFF),
        surfaceTintColor: Colors.transparent,
        title: Row(
          children: [
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.chevron_left_rounded,
                    color: Color(0xff292D32))),
            const Gap(5),
            Text(
              'Details',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(30),
            Center(
              child: CircleAvatar(
                backgroundColor: Color(0xffE3B8FF),
                radius: 40,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ),
            Gap(16),
            Text('${get.contact?.userName} ${get.contact?.surName}',
                style: GoogleFonts.syne(
                    fontSize: 24, fontWeight: FontWeight.w400)),
            Gap(10),
            Text(
              '${get.contact?.texts} on ${get.contact?.day}  at ${get.contact?.time}',
              textAlign: TextAlign.center,
              style: GoogleFonts.syne(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff6B6B6B)),
            ),
            Gap(24),
            Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: GoogleFonts.syne(
                          color: Color(0xff565050),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    buildTextField('${get.contact?.email}', Color(0xffFFFFFF),
                        type: TextInputType.emailAddress,
                        controller: _emailController),
                    Gap(16),
                    Text(
                      'Phone Contact',
                      style: GoogleFonts.syne(
                          color: Color(0xff565050),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    buildTextField(
                        '${get.contact?.phoneNumber}', Color(0xffFFFFFF),
                        type: TextInputType.phone,
                        controller: _phoneController),
                    Gap(16),
                    Text(
                      'Socials',
                      style: GoogleFonts.syne(
                          fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                    Gap(8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/facebook.png'),
                          width: 30,
                          height: 25,
                        ),
                        Gap(14),
                        Image(
                          image: AssetImage('assets/images/linkdin.png'),
                          width: 30,
                          height: 25,
                        ),
                        Gap(10),
                        Image(
                          image: AssetImage('assets/images/whatsapp.png'),
                          width: 35,
                          height: 32,
                        ),
                        Gap(10),
                        Image(
                          image: AssetImage('assets/images/telegram.png'),
                          width: 30,
                          height: 25,
                        ),
                      ],
                    ),
                  ],
                )),
            Gap(40),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xff007198)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavigation()));
                    controller.selectedIndex.value = 1;
                  },
                  child: Text(
                    'Export',
                    style: GoogleFonts.syne(
                        color: Color(0xffFFFFFF),
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
