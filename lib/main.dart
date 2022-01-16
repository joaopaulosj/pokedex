import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/constants/app_strings.dart';

import 'app_module.dart';

void main() {
  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData(primarySwatch: Colors.indigo).copyWith(
        textTheme: GoogleFonts.pressStart2pTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
    ).modular();
  }
}
