import 'package:flutter/material.dart';
import 'package:touchsync/controller/bottomNavController/bottomNav_controller.dart';
import 'package:touchsync/services/database/providers/contactProvider.dart';
import 'package:touchsync/services/database/providers/profileProvider.dart';
import 'package:provider/provider.dart';
import 'package:touchsync/services/nfc.Notifier/nfc_notifier.dart';

import 'views/read_tag_screen/read_tag_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Profileprovider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NFCNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => Contactprovider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const ReadTagPage(), //BottomNavigation(),
      ),
    );
  }
}
