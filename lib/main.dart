import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/auth/secret_code_screen.dart';

import 'providers/auth/google_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SecretCodeScreen(),
        // Home directory depends on wether the user is logged in or not
        // home: StreamBuilder(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (ctx, userSnapshot) {
        //     // Waiting
        //     if (userSnapshot.connectionState == ConnectionState.waiting) {
        //       return SplashScreen();
        //     }
        //     // Logged in
        //     if (userSnapshot.hasData) {
        //       return HomeScreen();
        //     }
        //     // Logged out
        //     return LoginScreen();
        //   },
        // ),
      ),
    );
  }
}
