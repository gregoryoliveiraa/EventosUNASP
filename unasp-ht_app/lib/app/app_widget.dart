import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:unasp_ht/app/pages/login/login_module.dart';
import 'package:unasp_ht/app/shared/constants.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'UNASP HT',
        theme: ThemeData(
          fontFamily: FONT_FAMILY,
          accentColor: ORANGE,
          primaryColor: BLUE,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: LoginModule(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
        ],
        
      );
}
