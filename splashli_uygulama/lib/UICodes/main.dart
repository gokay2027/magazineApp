import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashli_uygulama/UICodes/forgotPassword.dart';
import 'package:splashli_uygulama/UICodes/generalPage.dart';
import 'package:splashli_uygulama/UICodes/loginScreen.dart';
import 'package:splashli_uygulama/UICodes/onBoarding.dart';
import 'package:splashli_uygulama/UICodes/productsUI.dart';
import 'package:splashli_uygulama/UICodes/settingsUI.dart';
import 'package:splashli_uygulama/UICodes/signUpPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  print("selam");
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => OnBoardingScreen(),
        'loginScreen': (context) => LoginScreen(),
        'signUpScreen': (context) => SignUpScreen(),
        'forgotPasswordScreen': (context) => ForgotPassword(),
        'generalPage': (context) => GeneralPage(),
        'productsPage': (context) => ProductsPage(),
        'settingsPage': (context) => SettingsPage(),
      },
    ),
  );
}
