import 'package:flutter/material.dart';
import 'package:login_sharedpreferences/preferences.dart';
import 'package:login_sharedpreferences/screens/background.dart';
import 'package:login_sharedpreferences/screens/login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen',
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: Color(0xFFA0BAFD),
      ),
      body: Background(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Data from Login Screen:', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text(
                "email is ${Preferences.prefs?.getString("email")}",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "pass is ${Preferences.prefs?.getString("pass")}",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                alignment: Alignment.centerRight,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Preferences.prefs?.remove("email");
                    Preferences.prefs?.remove("pass");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(size.width * 0.5, 50.0),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    backgroundColor: const Color.fromARGB(255, 255, 177, 34),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                  ),
                  child: const Text(
                    'Log out',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
