import 'package:secondnumber/routes/bottom_nav.dart';
import 'package:secondnumber/screens/bin/bin_screen.dart';
import 'package:secondnumber/screens/calls/call_screen.dart';
import 'package:secondnumber/screens/chats/chats_screen.dart';
import 'package:secondnumber/screens/reg/createAccount.dart';
import 'package:secondnumber/screens/reg/interest.dart';
import 'package:secondnumber/screens/reg/signin_or_signup_screen.dart';
import 'package:secondnumber/screens/reg/verify_num.dart';
import 'package:secondnumber/screens/settings/settings_screen.dart';
import 'package:secondnumber/screens/welcome/getstarted_screen.dart';
import 'package:secondnumber/screens/welcome/welcome_screen.dart';
import 'package:secondnumber/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      home: WelcomeScreen(),
      routes: {
        //   '/splash': (context) => SplashScreen(),
        '/mainlayout': (context) => MainBottomClass(),
        '/interest': (context) => Interest(),
        '/verify': (context) => VerifyPhoneNum(),
        '/login': (context) => LoginAccount(),
        '/signup': (context) => CreateAccount(),
        '/welcome': (context) => WelcomeScreen(),
        '/getStarted': (context) => GetStartedScreen(),
        '/call': (context) => CallScreen(),
        '/chat': (context) => ChatScreen(),
        '/bin': (context) => BinScreen(),
        '/settings': (context) => SettingScreen(),
      },
      initialRoute: '/welcome',
    );
  }
}
