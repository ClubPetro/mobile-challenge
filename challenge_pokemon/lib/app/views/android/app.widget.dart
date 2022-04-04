import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'splash/splash.view.dart';
import 'themes/app.theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Challenge ClubPetro',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: SplashView(),
    );
  }
}
