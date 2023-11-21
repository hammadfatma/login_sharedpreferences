import 'package:flutter/material.dart';
import 'package:login_sharedpreferences/preferences.dart';
import 'package:login_sharedpreferences/screens/home.dart';

import 'background.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passEditingController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Screen',
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: Color(0xFFA0BAFD),
      ),
      body: Background(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Text(
              'Sign In',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                color: Color(0xFF2661FA),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: _emailEditingController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: _passEditingController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                String email = _emailEditingController.text;
                String pass = _passEditingController.text;
                Preferences.prefs?.setString("email", email);
                Preferences.prefs?.setString("pass", pass);
                if (email.isNotEmpty && pass.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                  _emailEditingController.clear();
                  _passEditingController.clear();
                }
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
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
