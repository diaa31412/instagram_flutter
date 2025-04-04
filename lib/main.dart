import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/respnsive/mobileScreenLayout.dart';
import 'package:instagram_flutter/respnsive/responsive_layout.dart';
import 'package:instagram_flutter/respnsive/webScreenLayout.dart';
import 'package:instagram_flutter/screens/loginScreen.dart';
import 'package:instagram_flutter/screens/signupScreen.dart';
import 'package:instagram_flutter/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAyxO4zIG0GVpPR9qnUEcXxQsxVnwNztUs",
        appId: "1:178357776505:web:3398401857af9d4871e4a8",
        messagingSenderId: "178357776505",
        projectId: "nstagram-c23cb",
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
