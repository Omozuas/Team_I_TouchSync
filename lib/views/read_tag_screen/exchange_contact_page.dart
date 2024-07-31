import 'package:flutter/material.dart';
import 'package:touchsync/views/read_tag_screen/success_exchange.dart';
import '../../global-colors/colorsHex.dart';
import 'widget/action_botton.dart';
import 'widget/read_page_form.dart';

class ExchangePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    void _showSaveContactDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              height: screenHeight / 3,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Save Contact to phone',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Save this contact to your phone storage.\nDo you want to allow this?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        child: Text(
                          'Allow',
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SuccessExchangePage(),
                            ),
                          );
                        },
                      ),
                      TextButton(
                        child: Text(
                          'Done',
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Container(
            width: 20,
            height: 20,
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Go Back',
          style: TextStyle(color: Colors.black, fontSize: 16),
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Email',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10),
            ReadPageForm(
              hintText: 'paul.fidelis@example.com',
            ),
            SizedBox(height: 20),
            Text(
              'Phone Contacts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10),
            ReadPageForm(
              hintText: 'Paul Fidelis',
            ),
            SizedBox(height: 20),
            Text(
              'Social Media Link',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10),
            Stack(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
                Positioned(
                  left: 12,
                  top: 12,
                  child: RichText(
                    text: TextSpan(
                      text: 'Facebook ',
                      style: TextStyle(
                        color: GlobalColors.blue,
                        fontSize: 18,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Twitter',
                          style: TextStyle(
                            color: GlobalColors.blue,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Location',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10),
            ReadPageForm(
              hintText: 'New York, USA',
            ),
            SizedBox(height: 20),
            ActionBtn(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              info: Text("Save Contact"),
              func: () => Navigator.pop(context),
              btnColor1: GlobalColors.blue,
              btnColor2: GlobalColors.blue,
            ),
            SizedBox(height: 20),
            ActionBtn(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              info: Text(
                "Save to phone",
                style: TextStyle(color: GlobalColors.blue),
              ),
              func: () => _showSaveContactDialog(context),
              btnColor1: GlobalColors.white,
              btnColor2: GlobalColors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
