import 'dart:async';
import 'package:auth_firebase/src/Common_widgets/common_widgets.dart';
import 'package:auth_firebase/src/onboarding/splash_screen/splash_screen.dart';
import 'package:auth_firebase/src/utils/colors/colors.dart';
import 'package:flutter/material.dart';

class welcome_screen extends StatefulWidget {
  const welcome_screen({super.key});

  @override
  State<welcome_screen> createState() => _welcome_screenState();
}
class _welcome_screenState extends State<welcome_screen> {

  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SplashScreen(),
          )); // MaterialPageRoute
    });
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
    child: SingleChildScrollView(
    child: Padding(
    padding: EdgeInsets.fromLTRB(20,MediaQuery.of(context).size.height*0.2, 20, 0
    ),
    child: Column(
    children: [
    logoWidget("assets/images/img-01.png"),
      SizedBox(
        height: 40,),
      Text("Trackme" , style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: Colors.white70 ),)
    ],
    ),
    ),
    ),

        ),
    );
  }

}