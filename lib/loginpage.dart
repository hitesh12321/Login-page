import 'package:flutter/material.dart';
import 'package:samplecheck/MyHomePage.dart';
import 'package:samplecheck/forgetPassword.dart';
import 'package:samplecheck/signuppage.dart';
import 'uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(String email, String password) async {
    if (email.isEmpty && password.isEmpty) {
      return Uihelper.customAlerBox(context, "enter the values ");
    } else {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString(),
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Myhomepage()),
        );
      } on FirebaseException catch (ex) {
        return Uihelper.customAlerBox(context, ex.code.toString());
      }
    }
  }

  signin(String email, String password) {
    if (email.isEmpty && password.isEmpty) {
      Uihelper.customAlerBox(context, "enter the details");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign-IN Page'), centerTitle: true),
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
              SizedBox(height: 20),
              Uihelper.customButton(() {
                login(
                  emailController.text.toString(),
                  passwordController.text.toString(),
                );
              }, 'Login'),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an accound?',
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Signuppage(),
                      ),
                    ),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Uihelper.customButton(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Forgetpassword()),
                );
              }, "Forget"),
            ],
          ),
        ),
      ),
    );
  }
}
