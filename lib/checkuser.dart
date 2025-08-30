import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:samplecheck/MyHomePage.dart';
import 'package:samplecheck/loginpage.dart';

class Checkuser extends StatefulWidget {
  const Checkuser({super.key});

  @override
  State<Checkuser> createState() => _CheckuserState();
}

class _CheckuserState extends State<Checkuser> {
  @override
  Widget build(BuildContext context) {
    return checkUser();
  }

  checkUser() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return Myhomepage();
    } else {
      return LoginPage();
    }
  }
}
