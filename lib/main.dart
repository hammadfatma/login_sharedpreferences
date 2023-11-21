import 'package:flutter/material.dart';
import 'package:login_sharedpreferences/preferences.dart';
import 'package:login_sharedpreferences/screens/home.dart';
import 'package:login_sharedpreferences/screens/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //>>>>>>>error Binding has not yet been initialized.
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var email = Preferences.prefs?.getString("email");
    var pass = Preferences.prefs?.getString("pass");
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: email == null || pass ==null ?LoginScreen():Home(),
    );
  }
}
