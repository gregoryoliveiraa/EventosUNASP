import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unasp_ht/app/pages/home/home_page.dart';

class EventBloc extends BlocBase {
  void signOut(BuildContext context) {
    Navigator.of(context)
        .pushReplacement<CupertinoPageRoute, CupertinoPageRoute>(
            CupertinoPageRoute(builder: (context) => HomePage()));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
