import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touchsync/services/database/providers/contactProvider.dart';
import 'package:touchsync/services/database/schemas/contact.schema.dart';
import 'package:touchsync/services/nfc.Notifier/nfc_notifier.dart';
import 'package:touchsync/widgets/snackBarRes.dart';
import 'package:uuid/uuid.dart';

import '../../widgets/dateformatter.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  @override
  Widget build(BuildContext context) {
    final uuid = Uuid();
    final get = context.watch<Contactprovider>();
    final get1 = context.watch<NFCNotifier>();
    return SafeArea(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              final now = DateTime.now();
              final profile = ContactSchema(
                id: uuid.v4(),
                userName: 'John',
                surName: 'Doe',
                otherName: 'Middle',
                location: '123 Main St',
                phoneNumber: '+1234567890',
                email: 'johndoe@example.com',
                messanger: '@johndoe_messanger',
                whatsapp: '+1234567890',
                telegram: '@johndoe_telegram',
                tiktok: '@johndoe_tiktok',
                paypal: 'paypal.me/johndoe',
                youtube: 'youtube.com/johndoe',
                facebook: 'facebook.com/johndoe',
                snapchat: '@johndoe_snapchat',
                zoomMeeting: 'zoom.us/j/1234567890',
                teams: 'teams.microsoft.com/l/johndoe',
                notion: 'notion.so/johndoe',
                day: '${formatDay(now)}',
                time: '${formatTime(now)}',
              );
              get.addItem(profile);
              setState(() {});
            },
            child: Text('Add Item'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(context: context, builder: (builder) => PopUPScreen());
              // get1.startNFCOperation(NFCOperation.write,contactName: ,contactEmail: ,contactNumber: ,contactUrl: );
              // setState(() {});
            },
            child: Text('write nfc'),
          ),
          ElevatedButton(
            onPressed: () {
              get1.startNFCOperation(NFCOperation.read);
              // success(context: context, message: get1.message);
            },
            child: Text('scan nfc'),
          ),
          get.profiles.isEmpty
              ? const Center(child: Text('No profiles available'))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: get.profiles.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = get.profiles[index];
                    return ListTile(
                      title: Text(item.userName.toString()),
                      subtitle: Text(item.time.toString()),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            get.deleteItem(item.id);
                          });
                        },
                      ),
                    );
                  },
                ),
          Text(get1.message),
          Text('${get1.map}'),
        ],
      ),
    );
  }
}

class PopUPScreen extends StatefulWidget {
  const PopUPScreen({
    super.key,
  });

  @override
  State<PopUPScreen> createState() => _PopUPScreenState();
}

class _PopUPScreenState extends State<PopUPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController contactNamecontroller = TextEditingController();
  TextEditingController contactEmailcontroller = TextEditingController();
  TextEditingController contactNumbercontroller = TextEditingController();
  TextEditingController contactUrlcontroller = TextEditingController();

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();

  // get1.startNFCOperation(NFCOperation.write,contactName: ,contactEmail: ,contactNumber: ,contactUrl: );
  // setState(() {});
  @override
  Widget build(BuildContext context) {
    final get1 = context.watch<NFCNotifier>();
    return Dialog(
      backgroundColor: Colors.white,
      key: _scaffoldkey,
      child: Container(
        width: 350,
        decoration:
            BoxDecoration(shape: BoxShape.rectangle, color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              textFiled(
                  keys: formKey1,
                  label: "contactName",
                  hintText: "Enter contactName",
                  controller2: contactNamecontroller,
                  keyboardType4: TextInputType.name),
              textFiled(
                  keys: formKey2,
                  label: "contactEmail",
                  hintText: "Enter contactEmail",
                  controller2: contactEmailcontroller,
                  keyboardType4: TextInputType.emailAddress),
              textFiled(
                  keys: formKey3,
                  label: "contactNumber",
                  hintText: "Enter contactNumber",
                  controller2: contactNumbercontroller,
                  keyboardType4: TextInputType.number),
              textFiled(
                  keys: formKey4,
                  label: "contactUrl",
                  hintText: "Enter contactUrl",
                  controller2: contactUrlcontroller,
                  keyboardType4: TextInputType.url),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  get1.startNFCOperation(NFCOperation.write,
                      contactName: contactNamecontroller.text,
                      contactEmail: contactEmailcontroller.text,
                      contactNumber: contactNumbercontroller.text,
                      contactUrl: contactUrlcontroller.text);
                  success(context: context, message: get1.message);
                },
                child: Text('write  to nfc'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget textFiled(
    {label,
    hintText,
    err,
    controller2,
    suffixIcon2,
    keyboardType4,
    validate,
    onchange,
    keys,
    obscureText = false}) {
  return Form(
    key: keys,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          onChanged: onchange,
          validator: validate,
          controller: controller2,
          keyboardType: keyboardType4,
          obscureText: obscureText,
          decoration: InputDecoration(
              suffixIcon: suffixIcon2,
              errorText: err,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              hintText: hintText,
              helperStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10))),
        ),
      ],
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (_) => Profileprovider(),
//         ),
//         ChangeNotifierProvider(
//           create: (_) => NFCNotifier(),
//         ),
//         ChangeNotifierProvider(
//           create: (_) => Contactprovider(),
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: const BottomNavigation(),
//       ),
//     );
//   }
// }
