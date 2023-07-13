import 'dart:async';

import 'package:eziline_project/screens/login_screen.dart';
import 'package:eziline_project/screens/panel_selection_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/home_Screen.dart';
class splashServices {

  void isSignIn(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(Duration(seconds: 4), () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => panel_selection()));
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => panel_selection()));
      });
    }
  }
}