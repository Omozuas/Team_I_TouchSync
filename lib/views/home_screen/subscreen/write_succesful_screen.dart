import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:touchsync/controller/bottomNavController/bottomNav_controller.dart';
import 'package:touchsync/routers/bottomNavRoute/bottomNav_Route.dart';
import 'package:touchsync/services/database/providers/tagProvider.dart';
import 'package:touchsync/services/database/schemas/tag.schema.dart';
import 'package:touchsync/widgets/custom_elevated_button.dart';
import 'package:uuid/uuid.dart';

class WriteSuccesfulScreen extends StatefulWidget {
  const WriteSuccesfulScreen(
      {super.key,
      this.name,
      this.email,
      this.company,
      this.jobTitle,
      this.phoneNumber,
      this.location});
  final name;
  final email;
  final company;
  final jobTitle;
  final phoneNumber;
  final location;
  @override
  State<WriteSuccesfulScreen> createState() => _WriteSuccesfulScreenState();
}

class _WriteSuccesfulScreenState extends State<WriteSuccesfulScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addTags();
  }

  final uiuid = Uuid();
  void addTags() {
    // Add tags here

    final tag = TagSchema(
      id: uiuid.v4(),
      name: widget.name,
      email: widget.email,
      company: widget.company,
      jobTitle: widget.jobTitle,
      phoneNumber: widget.phoneNumber,
      urls: widget.location,
    );
    final get = Provider.of<Tagprovider>(context, listen: false);
    get.addItem(tag);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavigationController());
    var screenSize = MediaQuery.of(context).size;
    // var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * 0.29,
          ),
          Align(
              alignment: Alignment.center,
              child: Image.asset('assets/images/succesful.png')),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          Text(
            'Tag Written Successfully',
            style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                height: 1.2,
                letterSpacing: -1),
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomElevatedButton(
                text: 'Add More Tags',
                //function to add more tags
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomElevatedButton(
                  text: 'Go to Profile',
                  backgroundColor: Colors.white,
                  textColor: Color(0xff007192),
                  borderColor: const Color(0xff007192),
                  // navigate to profile screen
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavigation()));
                    controller.selectedIndex.value = 3;
                  })),
        ],
      ),
    );
  }
}
