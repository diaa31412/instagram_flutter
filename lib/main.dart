import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/respnsive/mobileScreenLayout.dart';
import 'package:instagram_flutter/respnsive/responsive_layout.dart';
import 'package:instagram_flutter/respnsive/webScreenLayout.dart';
import 'package:instagram_flutter/screens/loginScreen.dart';
import 'package:instagram_flutter/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCY41zCG9Qxmb0Cot-cUdHUtvy8pLKiyow",
        appId: "1:372601830544:web:623224175ed6a80d7d2c15",
        messagingSenderId: "372601830544",
        projectId: "instagram-3b14a",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Instagram Clone",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: ResponsiveLaout(
      //   webScreenLayout: WebScreenLayout(),
      //   mobileScreenLayout: MobileScreenLayout(),

      // ),
      home: LogInScreen(),
    );
  }
}
