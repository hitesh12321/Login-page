import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:samplecheck/uihelper.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  TextEditingController emailController = TextEditingController();
  Future<void> forget(String email) async {
    try {
      if (email.isEmpty) {
        return Uihelper.customAlerBox(context, "please enter the email");
      } else {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

        return Uihelper.customAlerBox(
          context,
          " Passward Reset Link Sent to The given Email",
        );
      }
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "invalid-email") {
        return Uihelper.customAlerBox(
          context,
          "The email address is malformed",
        );
      } else if (ex.code == "user-not-found") {
        return Uihelper.customAlerBox(
          context,
          "No Firebase user exists with this email",
        );
      } else {
        return Uihelper.customAlerBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reset Password Page'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Uihelper.customTextField(
              emailController,
              "Enter the Email",
              Icons.email_rounded,
              false,
            ),
            SizedBox(height: 40),
            Uihelper.customButton(() {
              forget(emailController.text.trim());
            }, "Confirm Email"),
          ],
        ),
      ),
    );
  }
}



//forget(emailController.text.trim())  