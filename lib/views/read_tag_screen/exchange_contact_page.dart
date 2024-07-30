import 'package:flutter/material.dart';

import '../../global-colors/colorsHex.dart';
import 'widget/action_botton.dart';
import 'widget/read_page_form.dart'; // Import the new widget

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Container(
              width: 20,
              height: 20,
              child: Icon(Icons.arrow_back, color: Colors.black)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Go Back',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/person_image.jpg'),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Omozua Judah',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),

            // Email Text
            Text(
              'Email',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10),

            // Email ReadPageForm
            ReadPageForm(
              hintText: 'paul.fidelis@example.com',
            ),
            SizedBox(height: 20),

            // Phone Contacts
            Text(
              'Phone Contacts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10),

            // Phone Contacts ReadPageForm
            ReadPageForm(
              hintText: 'Paul Fidelis',
            ),
            SizedBox(height: 20),

            // Social Media Link
            Text(
              'Social Media Link',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10),

            // Social Media Link ReadPageForm
            Stack(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText:
                        '', // Empty hintText so it doesn't override the custom hint text
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
                Positioned(
                  left: 12,
                  top:
                      12, // Adjust the position to fit within the TextFormField
                  child: RichText(
                    text: TextSpan(
                      text: 'Facebook ',
                      style: TextStyle(
                        color: GlobalColors.blue, // Highlighted color
                        fontSize:
                            16, // Ensure font size matches the TextFormField
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Twitter',
                          style: TextStyle(
                            color: GlobalColors.blue, // Default hint text color
                            fontSize:
                                16, // Ensure font size matches the TextFormField
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Location
            Text(
              'Location',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10),

            // Location ReadPageForm
            ReadPageForm(
              hintText: 'New York, USA',
            ),
            SizedBox(height: 15),
            ActionBtn(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              info: Text("Save Contact"),
              func: () => Navigator.pop(context),
              btnColor1: GlobalColors.blue,
              btnColor2: GlobalColors.blue,
            ),
            SizedBox(height: 15),
            ActionBtn(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              info: Text(" Save to phone,",
                  style: TextStyle(color: GlobalColors.blue)),
              func: () => Navigator.pop(context),
              btnColor1: GlobalColors.white,
              btnColor2: GlobalColors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
