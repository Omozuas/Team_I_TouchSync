import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touchsync/services/database/providers/contactProvider.dart';
import 'package:touchsync/services/database/schemas/contact.schema.dart';
import 'package:touchsync/services/nfc.Notifier/nfc_notifier.dart';
import 'package:touchsync/views/read_tag_screen/success_exchange.dart';
import 'package:touchsync/widgets/dateformatter.dart';
import 'package:uuid/uuid.dart';
import '../../global-colors/colorsHex.dart';
import 'widget/action_botton.dart';
import 'widget/read_page_form.dart';

class ExchangePage extends StatefulWidget {
  ExchangePage({required this.map, super.key});
  Map<String, String?> map;
  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _urlController = TextEditingController();
    TextEditingController _showWorkingController = TextEditingController();
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    void _showSaveContactDialog(
        BuildContext context, Map<String, String?> map) {
      final get = Provider.of<NFCNotifier>(context, listen: false);
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
                          map = {
                            'name': '${widget.map['name']}',
                            'email': '${widget.map['email']}',
                            'phone': '${widget.map['phoneNumber']}',
                            'url': '${widget.map['url']}',
                            'org': '${widget.map['company']}',
                            'company': '${widget.map['org']}'
                          };
                          get.saveContactInfo(map);
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
                          'DisAllow',
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

    if (widget.map.isNotEmpty) {
      _emailController.text = widget.map['email'] ?? '';
      _phoneController.text = widget.map['phoneNumber'] ?? '';
      _urlController.text = widget.map['url'] ?? '';
      _showWorkingController.text = widget.map['location'] ?? '';
    }
    final get = context.watch<Contactprovider>();
    final uuid = Uuid();
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
                backgroundImage: AssetImage('assets/images/Ellipse 2.png'),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                widget.map.isEmpty ? 'Omozua Judah' : '${widget.map['name']}',
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
              controller: _emailController,
            ),
            SizedBox(height: 20),
            Text(
              'Phone Contacts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10),
            ReadPageForm(
              hintText: 'Paul Fidelis',
              controller: _phoneController,
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
              controller: _showWorkingController,
            ),
            SizedBox(height: 20),
            ActionBtn(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              info: Text(get.loading ? 'Saving...' : "Save Contact"),
              func: () {
                final now = DateTime.now();
                var profle = ContactSchema(
                  day: '${formatDay(now)}',
                  time: '${formatTime(now)}',
                  email: '${widget.map['email']}',
                  surName: '${widget.map['name']}',
                  texts: 'Recived conact from ${widget.map['name']}',
                  phoneNumber: '${widget.map['phoneNumber']}',
                  id: uuid.v4(),
                );
                get.addItem(profle);
                setState(() {});
                Navigator.pop(context);
              },
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
              func: () => _showSaveContactDialog(context, widget.map),
              btnColor1: GlobalColors.white,
              btnColor2: GlobalColors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
