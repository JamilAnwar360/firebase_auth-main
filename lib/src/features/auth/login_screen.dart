import 'dart:developer';
import 'package:auth_firebase/src/features/auth/auth_service.dart';
import 'package:auth_firebase/src/features/auth/signup_screen.dart';
import 'package:auth_firebase/src/features/home/home.dart';
import 'package:auth_firebase/src/utils/colors/colors.dart';
import 'package:auth_firebase/widgets/button.dart';
import 'package:auth_firebase/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors:
            [ hexstringtocolor("4b6cb7"),
              hexstringtocolor("182848")
            ],
                begin: Alignment.topCenter, end: Alignment.bottomCenter
            )
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const Spacer(),
            const Text("Login",
                style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w500)),
            const SizedBox(height: 70),
            CustomTextField(
              hint: "Enter Email",
              label: "Email",
              controller: _email,
            ),
            const SizedBox(height: 40),
            CustomTextField(
              hint: "Enter Password",
              label: "Password",
              isPassword: true,
              controller: _password,
            ),
            const SizedBox(height: 60),
            CustomButton(
              label: "Login",
              onPressed: _login,
            ),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Already have an account? ",style: TextStyle(color: Colors.grey),),
              InkWell(
                onTap: () => goToSignup(context),
                child:
                    const Text("Signup", style: TextStyle(color: Colors.white)),
              )
            ]),
            const Spacer()
          ],
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

  _login() async {
    final user = await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      log("User Logged In");
      // Fetch user data here
      final userData = await _auth.getCurrentUser();
      if (userData != null) {
        // Do something with userData
        print("User email: ${userData.email}");
      }
      goToHome(context);
    }
  }

}
