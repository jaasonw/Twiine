import 'package:firebase_auth/firebase_auth.dart';
import 'package:twiine/auth.dart';
import 'package:flutter/material.dart';

class LoginChecker extends StatefulWidget {
  @override
  LoginCheckerState createState() => LoginCheckerState();
}

class LoginCheckerState extends State<LoginChecker>{
  @override
  Widget build(BuildContext context) {
    _checkForLoggedIn().then((value) => {
      if (value)
        Navigator.of(context).pushNamed('/navBar')
      else
        Navigator.of(context).pushNamed('/landing')
    });
    return Scaffold();
  }

  Future<bool> _checkForLoggedIn() async {
    FirebaseUser currentUser = await Auth.firebaseAuth.onAuthStateChanged.first;
    return (currentUser != null);
  }
}