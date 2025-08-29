import 'package:flutter/material.dart';
import 'package:samplecheck/MyHomePage.dart';
import 'package:samplecheck/loginpage.dart';
import 'uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  signUp(String email, String password) async {
    if (passwordController.text != confirmpasswordcontroller.text) {
      Uihelper.customAlerBox(context, 'Enter Same Passward in Both Places');
    }

    if (email.isEmpty && password.isEmpty) {
      Uihelper.customAlerBox(context, "Enter Required Entries");
    } else {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const Myhomepage()),
        );
      } on FirebaseAuthException catch (ex) {
        // ignore: use_build_context_synchronously
        return Uihelper.customAlerBox(context, ex.code.toString());
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign-Up page'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uihelper.customTextField(
                emailController,
                ' Enter Email',
                Icons.email,
                false,
              ),

              SizedBox(height: 10),

              Uihelper.customTextField(
                passwordController,
                "Enter Passward",
                Icons.password,
                true,
              ),
              SizedBox(height: 10),

              Uihelper.customTextField(
                confirmpasswordcontroller,
                "Enter Passward Again",
                Icons.password,
                true,
              ),
              SizedBox(height: 20),
              Uihelper.customButton(() {
                signUp(
                  emailController.text.toString(),
                  passwordController.text.toString(),
                );
              }, 'save'),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an accound?',
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
