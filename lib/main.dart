import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:touchsync/controller/bottomNavController/bottomNav_controller.dart';
import 'package:touchsync/services/database/providers/contactProvider.dart';
import 'package:touchsync/services/database/providers/profileProvider.dart';
import 'package:provider/provider.dart';
import 'package:touchsync/services/database/providers/tagProvider.dart';
import 'package:touchsync/services/database/realm.db.dart';
import 'package:touchsync/services/database/schemas/profie.schema.dart';
import 'package:touchsync/services/nfc.Notifier/nfc_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetingbinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetingbinding);
// Check if the user profile exists
  bool profileExists = await checkIfProfileExists('user123');
  if (!profileExists) {
    // If the user profile does not exist, create a new one
    await createDefaultProfile('user123');
  }
  runApp(const MyApp());
}

Future<bool> checkIfProfileExists(String id) async {
  ProfileSchema? profile = await DatabaseHelper.instance.fetchProfileById(id);
  return profile != null;
}

Future<void> createDefaultProfile(String id) async {
  ProfileSchema profile = ProfileSchema(
    id: id,
    userName: '',
    surName: '',
    otherName: '',
    location: '',
    phoneNumber: '',
    email: '',
    messenger: '',
    whatsapp: '',
    telegram: '',
    tiktok: '',
    paypal: '',
    youtube: '',
    facebook: '',
    instagram: '',
    appStore: '',
    zoom: '',
    teams: '',
    notion: '',
  );
  await DatabaseHelper.instance.insertProfile(profile);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initilization();
  }

  void initilization() async {
    await Future.delayed(Duration(seconds: 3));

    FlutterNativeSplash.remove();
  }

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
        ChangeNotifierProvider(
          create: (_) => Tagprovider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const BottomNavigation(),
      ),
    );
  }
}
