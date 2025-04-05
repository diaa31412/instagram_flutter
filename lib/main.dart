import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/providers/userProvider.dart';
import 'package:instagram_flutter/resources/auth_methods.dart';
import 'package:instagram_flutter/respnsive/mobileScreenLayout.dart';
import 'package:instagram_flutter/respnsive/responsive_layout.dart';
import 'package:instagram_flutter/respnsive/webScreenLayout.dart';
import 'package:instagram_flutter/screens/loginScreen.dart';
import 'package:instagram_flutter/screens/signupScreen.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAyxO4zIG0GVpPR9qnUEcXxQsxVnwNztUs",
        appId: "1:178357776505:web:3398401857af9d4871e4a8",
        messagingSenderId: "178357776505",
        projectId: "nstagram-c23cb",
        storageBucket: "instagram-c23cb.firebasestorage.app",
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
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Instagram Clone",
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
          //check the state of user
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // if state connection active will show page layout
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return ResponsiveLaout(
                  webScreenLayout: WebScreenLayout(),
                  mobileScreenLayout: MobileScreenLayout(),
                );
                //if state connection has error will show the error for the user
              } else if (snapshot.hasError) {
                return Center(child: Text('${snapshot.error}'));
              }
            }
            //check if the connection in waiting time will show this process
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: primaryColor),
              );
            }
            // when we dont connection will return login page
            return LogInScreen();
          },
        ),
      ),
    );
  }
}
